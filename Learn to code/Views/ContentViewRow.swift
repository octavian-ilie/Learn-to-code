//
//  ContentViewRow.swift
//  Learn to code
//
//  Created by Octavian Mihuț Ilie on 22/03/2021.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model: ContentModel
    var index: Int
    
    var body: some View {
        
        let lesson = model.currentModule!.content.lessons[index]
        
        // lesson card
        ZStack (alignment: .leading) {
            Rectangle()
                .fill(Color.offWhite)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                .frame(height: 66)
            
            HStack (spacing: 15) {
                Image(systemName: String(index + 1) + ".square.fill")
                    .font(.system(size: 35))
                    .foregroundColor(Color("tungsten"))
                    .padding(.leading, 15)
                
                VStack (alignment: .leading) {
                    Text(lesson.title)
                        .foregroundColor(Color("tungsten"))
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                    Text(lesson.duration)
                        .foregroundColor(Color("tungsten"))
                        .font(.system(size: 12, weight: .light, design: .rounded))
                }
            }
        }
        .padding(.bottom, 15)
    }
}
