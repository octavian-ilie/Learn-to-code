//
//  HomeCard.swift
//  Learn to code
//
//  Created by Octavian Mihuț Ilie on 19/03/2021.
//

import SwiftUI

struct HomeCard: View {
    
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color.offWhite)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                .aspectRatio(CGSize(width: 335, height: 145), contentMode: .fit)
            
            HStack (spacing: 25) {
                
                // image
                Image(image)
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                
                // info
                VStack (alignment: .leading, spacing: 0) {
                    
                    // headline
                    Text(title)
                        .foregroundColor(Color("tungsten"))
                        .font(.system(size: 25, weight: .medium, design: .rounded))
                        .padding(.bottom, 5)
                    
                    // description
                    Text(description)
                        .foregroundColor(Color("tungsten"))
                        .font(.system(size: 12, weight: .light, design: .rounded))
                    
                    Spacer()
                    
                    // details stack
                    HStack {
                        
                        // no. lessons/questions
                        HStack {
                            Image(systemName: "text.book.closed")
                                .resizable()
                                .frame(width: 14, height: 14)
                                .foregroundColor(Color("steel"))
                            Text(count)
                                .foregroundColor(Color("steel"))
                                .font(.system(size: 12, weight: .regular, design: .rounded))
                        }
                        
                        Spacer()
                        
                        // duration
                        HStack {
                            Image(systemName: "clock")
                                .resizable()
                                .frame(width: 14, height: 14)
                                .foregroundColor(Color("steel"))
                            Text(time)
                                .foregroundColor(Color("steel"))
                                .font(.system(size: 12, weight: .regular, design: .rounded))
                        }
                        
                    }
                    .padding(.top, -15)
                }
                
            }
            .padding(25)
        }
        
    }
}

struct HomeCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeCard(image: "test", title: "test", description: "test", count: "test", time: "test")
    }
}
