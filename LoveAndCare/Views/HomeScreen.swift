//
//  HomeScreen.swift
//  LoveAndCare
//
//  Created by Mohamed Ali on 17/05/2024.
//

import SwiftUI

struct HomeScreen: View {
    
    // Access the presentation mode environment value
    @Environment(\.presentationMode) var presentationMode
    
    @State var imageOffest = false
    
    @AppStorage("status") var status = false
    
    var body: some View {
        
        NavigationView {
        
            VStack {
                
                Spacer()
                
                ZStack {
                    CircleView(color: .gray)
                    
                    Image("baby-boy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 450,alignment: .center)
                        .offset(y: imageOffest ? -10 : 10)
                        .animation(.easeOut(duration: 2.5).repeatForever(autoreverses: true), value: imageOffest)
                }
                
                
                Text("Having children just puts the whole world into perspective. Everything else Just disappears")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.gray)
                    .padding(.horizontal,15)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                
                
                Button(action: {
                    
                    status.toggle()
                    
                    PlaySound.shared.setData(fileName: "success", fileType: "m4a")
                    PlaySound.shared.playSound()
                    
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.clockwise.circle") // Use a suitable system image
                            .foregroundColor(.white)
                        Text("Restart")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity) // Makes the button width flexible
                    .background(Color.blue)
                    .cornerRadius(40)  // Adjust the corner radius to make it look like a capsule
                }
                .frame(height: 80)
                .padding(.horizontal, 110) // Optional: Adjust padding as needed
                .background(Color.clear)
                

                
                
            } // MARK: - VStact
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    imageOffest.toggle()
                }
                
                
            }
            
        } // MARK: - NavigationView
        .navigationBarBackButtonHidden()
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
