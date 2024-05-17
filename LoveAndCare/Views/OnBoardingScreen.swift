//
//  ContentView.swift
//  LoveAndCare
//
//  Created by Mohamed Ali on 11/05/2024.
//

import SwiftUI

struct OnBoardingScreen: View {
    
    @State var animationBool = false
    
    @State var imgageOffest = CGSize(width: 0, height: 0)
    
    @State var buttonOffest: CGFloat = 0.0
    
    @State var buttonSize = UIScreen.main.bounds.width - 160
    
    @State private var shouldNavigate = false
    
    var body: some View {
        GeometryReader { geomotery in
            
            NavigationView {
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
                            
                            Spacer(minLength: 50)
                            
                            
                        } // MARK: - VStack
                        .offset(y: animationBool ? 0 : -70)
                        .animation(.easeOut(duration: 0.9), value: animationBool)
                        .scaledToFit()
                        
                        
                        ZStack {
                            CircleView(color: .white)
                                .offset(x: -1 * imgageOffest.width)
                                .blur(radius: abs(imgageOffest.width / 5),opaque: false)
                            
                            Image("happy-pregnant")
                                .resizable()
                                .scaledToFit()
                                .offset(x: imgageOffest.width)
                                .rotationEffect(.degrees(imgageOffest.width / 15))
                                .shadow(color: .black.opacity(0.5), radius: 8.0, x: 3, y: 3)
                                .frame(width: 300)
                                .overlay(
                                    Image(systemName: "arrow.left.and.right.circle")
                                        .font(.system(size: 40,weight: .ultraLight, design: .rounded))
                                        .foregroundColor(.white)
                                        .opacity(imgageOffest.width == 0 ? 1: 0),
                                    
                                    alignment: .bottom
                                )
                                .gesture(DragGesture()
                                    .onChanged({ guester in
                                        if abs(guester.translation.width) <= 150 {
                                            imgageOffest = guester.translation
                                        }
                                        
                                    })
                                         
                                    .onEnded({ _ in
                                        
                                        withAnimation(.easeOut(duration: 0.8)) {
                                            imgageOffest = .zero
                                        }
                                        
                                        
                                    })
                                )
                            
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
                                    .frame(width: 80 + buttonOffest)
                                
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
                                .offset(x: buttonOffest)
                                .gesture(DragGesture()
                                    .onChanged({ guester in
                                        
                                        if guester.translation.width > 0 && guester.translation.width < buttonSize {
                                            buttonOffest = guester.translation.width
                                        }
                                    })
                                         
                                        .onEnded({ _ in
                                            if buttonOffest > buttonSize / 2 {
                                                shouldNavigate.toggle()
                                                
                                                withAnimation(.easeOut(duration: 0.8)) {
                                                    buttonOffest = 0.0
                                                }
                                            }
                                            else {
                                                withAnimation(.easeOut(duration: 0.8)) {
                                                    buttonOffest = 0.0
                                                }
                                            }
                                        })
                                
                                )
                                NavigationLink("", destination: HomeScreen(),isActive: $shouldNavigate)
                                
                                Spacer()
                                
                            }
                            
                            
                        } // MARK: - ZStack
                        .frame(height: 80, alignment: .center)
                        .padding(.horizontal,40)
                        .padding(.top,50)
                        .offset(y: animationBool ? 0 : 80)
                        .animation(.easeIn(duration: 0.9), value: animationBool)
                        
                    } // MARK: - VStack
                    
                    
                    
                } // MARK: - ZStack
            } // MARK: - NaviationView
            .navigationBarBackButtonHidden()
            .onAppear {
                animationBool.toggle()
            }
            
            
            
            
            
        } // MARK: - GeometryReader
    }
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScreen()
    }
}
