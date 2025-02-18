//
//  TODOListApp.swift
//  TODOList
//
//  Created by Mark on 18.02.2025.
//

import FirebaseCore
import SwiftUI

@main
struct TODOListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
