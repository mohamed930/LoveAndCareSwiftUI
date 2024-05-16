//
//  ContentView.swift
//  LoveAndCare
//
//  Created by Mohamed Ali on 11/05/2024.
//

import SwiftUI

struct OnBoardingScreen: View {
    
    var body: some View {
        GeometryReader { geomotery in
            ZStack {
                Color("ColorBlue")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    VStack {
                        
                        Text("Care.")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Life doesn't come with a manual, it comes with a mother")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal,10)
                        
                    } // MARK: - VStack
                    
                    
                    ZStack {
                        CircleView(color: .white)
                        
                        Image("happy-pregnant")
                            .resizable()
                            .scaledToFit()
                            .shadow(color: .black.opacity(0.5), radius: 8.0, x: 3, y: 3)
                            .overlay(
                                Image(systemName: "arrow.left.and.right.circle")
                                    .font(.system(size: 40,weight: .ultraLight, design: .rounded))
                                    .foregroundColor(.white) ,
                                
                                alignment: .bottom
                            )
                        
                        Spacer() // Pushes content to the top
                    } // MARK: - ZStack
                    
                    ZStack {
                        
                        Capsule()
                            .fill(.white.opacity(0.2))
                        
                        Capsule()
                            .fill(.white.opacity(0.2))
                            .padding(8)
                        
                        Text("Start")
                            .font(.system(size: 34,weight: .bold))
                            .foregroundColor(.white)
                        
                        HStack {
                            Capsule()
                                .fill(Color("ColorRed"))
                                .frame(width: 80)
                            
                            Spacer()
                        }
                        
                        HStack {
                            ZStack {
                                Capsule()
                                    .fill(Color("ColorRed"))
                                
                                Capsule()
                                    .fill(.black.opacity(0.2))
                                    .padding(8)
                                
                                Image(systemName: "chevron.right.2")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                
                            }
                            .frame(width: 80)
                            
                            Spacer()
                            
                        }
                        
                        
                    } // MARK: - ZStack
                    .frame(height: 80, alignment: .center)
                    .padding(.horizontal,40)
                    .padding(.top,20)
                    
                    
                } // MARK: - VStack
                
                
                
            } // MARK: - ZStack
            
        } // MARK: - GeometryReader
    }
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreen()
    }
}
