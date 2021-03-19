//
//  Learn_to_codeApp.swift
//  Learn to code
//
//  Created by Octavian Mihuț Ilie on 19/03/2021.
//

import SwiftUI

@main
struct Learn_to_codeApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
