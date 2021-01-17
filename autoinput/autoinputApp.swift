//
//  autoinputApp.swift
//  autoinput
//
//  Created by 张一鸣 on 2021/1/17.
//

import SwiftUI

@main
struct autoinputApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.commands{
            AppCommands()
        }
    }
}
