//
//  LessonButton.swift
//  Learn to code
//
//  Created by Octavian Mihuț Ilie on 06/04/2021.
//

import SwiftUI

struct LessonButton: View {
    
    var label: String
    var color = Color.orange
    var foreground = Color.black
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 50)
                .foregroundColor(color)
                .cornerRadius(10)
                
            Text(label)
                .foregroundColor(foreground)
                .bold()
        }
    }
}

struct LessonButton_Previews: PreviewProvider {
    static var previews: some View {
        LessonButton(label: "Demo")
    }
}
