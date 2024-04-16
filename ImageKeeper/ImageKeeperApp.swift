//
//  ImageKeeperApp.swift
//  ImageKeeper
//
//  Created by Sebastian Marquez Rojas on 15/04/2024.
//

import SwiftUI
import SwiftData

@main
struct ImageKeeperApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: PhotoModel.self)
        }
    }
}
