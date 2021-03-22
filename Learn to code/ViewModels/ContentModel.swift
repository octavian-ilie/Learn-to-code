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
    
    // current lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    // current lesson explanation
    @Published var lessonDescription = NSAttributedString()
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
    
    func beginLesson(_ lessonIndex: Int) {
        
        // check that the lesson index is within range of module lessons
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        } else {
            currentLessonIndex = 0
        }
        
        // set the current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonDescription = addStyling(currentLesson!.explanation)
    }
    
    func nextLesson() {
        
        // advance the lesson
        currentLessonIndex += 1
        
        // check that is within range
        if currentLessonIndex < currentModule!.content.lessons.count {
            
            // set the current lesson property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
        } else {
            // reset the lesson state
            currentLessonIndex = 0
            currentLesson = nil
        }
        
    }
    
    // check if there is a next lesson and return true/false
    func hasNextLesson() -> Bool {
       return currentLessonIndex + 1 < currentModule!.content.lessons.count
    }
    
    // MARK: - Code Styling
    
    private func addStyling(_ htmlString: String) -> NSAttributedString {
        
        var resultString = NSAttributedString()
        var data = Data()
        
        // add the styling data
        if styleData != nil {
            data.append(self.styleData!)
        }
        
        // add html data
        data.append(Data(htmlString.utf8))
        
        // convert to attributed string
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            resultString = attributedString
        }
        
        return resultString
    }
    
}
