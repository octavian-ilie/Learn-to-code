//
//  ContentView.swift
//  Learn to code
//
//  Created by Octavian Mihuț Ilie on 22/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color.offWhite)
                .ignoresSafeArea()
            
            ScrollView {
                LazyVStack {
                    
                    // confirm that currentModule is set
                    if model.currentModule != nil {
                        ForEach(0..<model.currentModule!.content.lessons.count) { index in
                            NavigationLink(
                                destination:
                                    ContentDetailView()
                                        .onAppear(perform: {
                                            model.beginLesson(index)
                                        }),
                                label: {
                                    ContentViewRow(index: index)
                                })
                        }
                    }
                    
                }
                .padding(25)
                .navigationTitle("Learn \(model.currentModule?.category ?? "")")
            }
        }
        
    }
}
