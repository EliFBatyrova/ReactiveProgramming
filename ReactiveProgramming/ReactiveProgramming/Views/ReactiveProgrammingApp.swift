//
//  ReactiveProgrammingApp.swift
//  ReactiveProgramming
//
//  Created by underq  on 06.11.2020.
//

import Firebase
import SwiftUI

@main
struct ReactiveProgrammingApp: App {
    
    init() {
     FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
