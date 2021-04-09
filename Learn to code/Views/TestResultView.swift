//
//  TestResultView.swift
//  Learn to code
//
//  Created by Octavian Mihuț Ilie on 07/04/2021.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var numCorrect: Int
    
    var body: some View {
        VStack {
            
            Text(complimentText)
                .font(.system(size: 30, weight: .regular, design: .default))
                .padding(.top, 50)
                .padding(.horizontal, 25)
            
            Text("\(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0)")
                .font(.system(size: 40, weight: .bold, design: .default))
                .padding(.top, 5)
            
            Spacer()
            
            Button(action: {
                model.currentTestSelected = nil
            }, label: {
                LessonButton(label: "Back to lessons")
            })
            .padding(25)
        }
    }
    
    var complimentText: String {
        
        guard model.currentModule != nil else {
            return ""
        }
        
        let procentage = Double(numCorrect)/Double(model.currentModule!.test.questions.count)
        
        if procentage > 0.7 {
            return "Awesome!"
        } else if procentage > 0.5 {
            return "You're doing great!"
        } else if procentage > 0.2 {
            return "Practice makes perfect!"
        } else {
            return "Oh, no! Keep learning."
        }
        
    }
}

struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultView(numCorrect: 9)
    }
}
