//
//  HomeScreen.swift
//  LoveAndCare
//
//  Created by Mohamed Ali on 17/05/2024.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        
        NavigationView {
        
            ZStack {
                ZStack {
                    CircleView(color: .gray)
                    
                    Image("baby-boy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 450,alignment: .center)
                }
            }
            
        } // MARK: - NavigationView
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeScreen()
}
