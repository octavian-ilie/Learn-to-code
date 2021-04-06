//
//  TestView.swift
//  Learn to code
//
//  Created by Octavian Mihuț Ilie on 06/04/2021.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        if model.currentQuestion != nil {
            
            VStack {
                // question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                
                // question
                CodeTextView()
                
                // answers
                
                // button
                
            }
            .padding(25)
            .navigationTitle("\(model.currentModule?.category ?? "") Quiz")

        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
