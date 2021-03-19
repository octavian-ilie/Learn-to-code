//
//  ContentView.swift
//  Learn to code
//
//  Created by Octavian Mihuț Ilie on 19/03/2021.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        Text("Learn to code!")
            .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
