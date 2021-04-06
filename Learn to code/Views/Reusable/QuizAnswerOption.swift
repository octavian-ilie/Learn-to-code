//
//  QuizAnswerOption.swift
//  Learn to code
//
//  Created by Octavian Mihuț Ilie on 06/04/2021.
//

import SwiftUI

struct QuizAnswerOption: View {
    
    var label: String
    var color = Color.white
    var foreground = Color.black
    var shadowColor = Color.gray
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 50)
                .foregroundColor(color)
                .cornerRadius(10)
                .shadow(color: shadowColor, radius: 5)
                
            Text(label)
                .foregroundColor(foreground)
                .bold()
        }
    }
}

struct QuizAnswerOption_Previews: PreviewProvider {
    static var previews: some View {
        QuizAnswerOption(label: "Demo")
    }
}
