//
//  LoveAndCareApp.swift
//  LoveAndCare
//
//  Created by Mohamed Ali on 11/05/2024.
//

import SwiftUI

@main
struct LoveAndCareApp: App {
    
    @AppStorage("status") var status = false
    
    var body: some Scene {
        WindowGroup {
            
            if status {
                HomeScreen()
            }
            else {
                OnBoardingScreen()
            }
            
            
        }
    }
}
