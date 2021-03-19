//
//  ContentModel.swift
//  Learn to code
//
//  Created by Octavian Mihuț Ilie on 19/03/2021.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published  var modules = [Module]()
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
    }
    
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
}
