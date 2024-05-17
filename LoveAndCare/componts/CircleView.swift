//
//  CircleView.swift
//  LoveAndCare
//
//  Created by Mohamed Ali on 16/05/2024.
//

import SwiftUI

struct CircleView: View {
    
    @State var color: Color
    
    @State var animationBool = false
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(color.opacity(0.2),lineWidth: 40)
                .frame(width: 280, height: 280, alignment: .center)
            
            Circle()
                .stroke(color.opacity(0.2),lineWidth: 80)
                .frame(width: 280, height: 280, alignment: .center)
            
        } // MARK: - ZStack
        .scaleEffect(animationBool ? 1: 0.5)
        .animation(.easeOut(duration: 0.9), value: animationBool)
        .onAppear {
            if animationBool == false {
                animationBool.toggle()
            }
            
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .gray)
    }
}
