//
//  Craft_AlleyApp.swift
//  Craft Alley
//
//  Created by Mariam Hussein on 7/5/23.
//

import SwiftUI

@main
struct Craft_AlleyApp: App {
    @StateObject private var appData = ApplicationData()

    var body: some Scene {
        WindowGroup {
            LoginView().environmentObject(appData)
        }
    }
}
