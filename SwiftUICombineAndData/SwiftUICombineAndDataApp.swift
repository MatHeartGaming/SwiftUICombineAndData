//
//  SwiftUICombineAndDataApp.swift
//  SwiftUICombineAndData
//
//  Created by Matteo Buompastore on 31/05/23.
//

import SwiftUI
import Firebase

@main
struct SwiftUICombineAndDataApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
