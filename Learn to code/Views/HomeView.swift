//
//  ContentView.swift
//  Learn to code
//
//  Created by Octavian Mihuț Ilie on 19/03/2021.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            ZStack {
                // MARK: Background
                Rectangle()
                    .foregroundColor(Color.offWhite)
                    .ignoresSafeArea()
                
                VStack (alignment: .leading) {
                    
                    Text("What would you like to do today?")
                        .foregroundColor(Color("steel"))
                        .font(.system(size: 20, weight: .light, design: .rounded))
                        .padding(.horizontal, 20)
                    
                    // MARK: Content
                    ScrollView {
                        
                        LazyVStack (spacing: 30) {

                            ForEach(model.modules) { module in
                                
                                NavigationLink(
                                    destination:
                                        ContentView()
                                            .onAppear(perform: {
                                                model.beginModule(module.id)
                                            }),
                                    label: {
                                        // lesson card
                                        HomeCard(image: module.content.image,
                                                 title: "Learn \(module.category)",
                                                 description: module.content.description,
                                                 count: "\(module.content.lessons.count) lessons",
                                                 time: module.content.time)
                                    })

                                // quiz card
                                HomeCard(image: module.test.image,
                                         title: "\(module.category) Quiz",
                                         description: module.test.description,
                                         count: "\(module.test.questions.count) questions",
                                         time: module.test.time)
                                
                            }
                        }
                        .padding(25)
                    }
                }

            }
            .navigationTitle("Get started")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
