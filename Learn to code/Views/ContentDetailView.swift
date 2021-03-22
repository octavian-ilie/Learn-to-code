//
//  ContentDetailView.swift
//  Learn to code
//
//  Created by Octavian Mihuț Ilie on 22/03/2021.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let videoUrl = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack (spacing: 25) {
            // only show video if there's a valid url
            if videoUrl != nil {
                VideoPlayer(player: AVPlayer(url: videoUrl!))
                    .cornerRadius(10)
            }
            
            // description
            CodeTextView()
            
            // show next lesson button, only if there is a next lesson
            if model.hasNextLesson() {
                Button(action: {
                    
                    // advance the lesson
                    model.nextLesson()
                    
                }, label: {
                    
                    ZStack {
                        Rectangle()
                            .frame(height: 50)
                            .foregroundColor(Color.green)
                            .cornerRadius(10)
                            
                        Text("Next: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                    
                })
            }
            
        }
        .padding(25)
        .navigationTitle(lesson?.title ?? "Lesson")
        
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
