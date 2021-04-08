//
//  TestView.swift
//  Learn to code
//
//  Created by Octavian Mihuț Ilie on 06/04/2021.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var selectedAnswerIndex = -1
    @State var submitted = false
    
    @State var numCorrect = 0
    
    var body: some View {
        if model.currentQuestion != nil {
            
            VStack (alignment: .leading) {
                // question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                // question
                CodeTextView()
                    .padding(25)
                
                // answers
                ScrollView {
                    VStack {
                        ForEach (0..<model.currentQuestion!.answers.count, id: \.self) { index in
                            
                            Button {
                                // track the selected index
                                selectedAnswerIndex = index
                                
                            } label: {
                                
                                if !submitted {
                                    QuizAnswerOption(label: model.currentQuestion!.answers[index],
                                                     color: index == selectedAnswerIndex ? .gray : .white,
                                                     foreground: index == selectedAnswerIndex ? .white : .black)
                                } else {
                                    if index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex {
                                        // show green (correct answer)
                                        QuizAnswerOption(label: model.currentQuestion!.answers[index],
                                                         color: .green,
                                                         foreground: .white,
                                                         shadowColor: .green)
                                    } else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex {
                                        // show red (incorrect answer)
                                        QuizAnswerOption(label: model.currentQuestion!.answers[index],
                                                         color: .red,
                                                         foreground: .white,
                                                         shadowColor: .red)
                                    } else if index == model.currentQuestion!.correctIndex {
                                        // this (was) the correct answer
                                        QuizAnswerOption(label: model.currentQuestion!.answers[index],
                                                         color: .green,
                                                         foreground: .white,
                                                         shadowColor: .green)
                                    } else {
                                        // also show the rest of the answers
                                        QuizAnswerOption(label: model.currentQuestion!.answers[index],
                                                         color: .white)
                                    }
                                }
                                
                            }
                            .padding(.horizontal, 25)
                            .padding(.vertical, 8)
                            .disabled(submitted)
                        }
                    }
                }
                
                // submit answer button
                Button(action: {
                    
                    // check if answer has been submitted
                    if submitted {
                        // answer has already been submitted, move to next question
                        model.nextQuestion()
                        
                        // reset properties
                        submitted = false
                        selectedAnswerIndex = -1
                        
                    } else {
                        // submit the answer
                        // change submitted state to true
                        submitted = true
                        
                        // check answer and increment counter if correct
                        if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                            numCorrect += 1
                        }
                    }
                    
                }, label: {
                    LessonButton(label: buttonText,
                                 color: selectedAnswerIndex >= 0 ? Color.orange : Color.gray,
                                 foreground: selectedAnswerIndex >= 0 ? Color.black : Color.white)
                })
                .padding(25)
                .disabled(selectedAnswerIndex < 0)
                
            }
            .navigationTitle("\(model.currentModule?.category ?? "") Quiz")

        }
        else {
            // if current question is nil, show result view
            TestResultView(numCorrect: numCorrect)
        }
    }
    
    var buttonText: String {
        // check if answer has been submitted
        if submitted {
            if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count {
                // this is the last question
                return "Finish"
            } else {
                return "Continue"
            }
        } else {
            return "Submit"
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
