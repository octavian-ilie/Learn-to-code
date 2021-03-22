//
//  ContentModel.swift
//  Learn to code
//
//  Created by Octavian Mihuț Ilie on 19/03/2021.
//

import Foundation

class ContentModel: ObservableObject {
    
    // list of modules
    @Published  var modules = [Module]()
    
    // current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
    }
    
    // MARK: - Data methods
    
    func getLocalData() {
        
        // get the url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // try to decode json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // assign parsed modules to modules property
            self.modules = modules
            
        } catch {
            // error handling
            fatalError("Can't parse json data")
        }
        
        // prse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            // read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
            
        } catch {
            // log error
            fatalError("Couldn't parse style data")
        }
    
    }
    
    // MARK: - Module navigation methods
    
    func beginModule(_ moduleID: Int) {
        
        // find the index for this module id
        for index in 0..<modules.count {
            if modules[index].id == moduleID {
                // found the matching module
                currentModuleIndex = index
                break
            }
        }
        
        // set the current module
        currentModule = modules[currentModuleIndex]
    }
}
