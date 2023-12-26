//
//  ContentView.swift
//  drag-and-sound
//
//  Created by kehinde on 26/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var bWidth:CGFloat = UIScreen.main.bounds.width - 80
    @State private var bOffset : CGFloat = 0
    
    
    var body: some View {
        VStack {
            
            ZStack{
                HStack{
                    Capsule().fill(.white.opacity(0.2))
                }.frame(maxWidth: .infinity)
                HStack{
                    Capsule().fill(.red).frame(width: bOffset + 80 , height: 80)
                    Spacer()
                }
                HStack{
                    Capsule().fill(.cyan).frame(width: 80 , height: 80)
                    Spacer()
                }.offset(x:bOffset).gesture(DragGesture().onChanged(){ gesture in
                    
                    if(gesture.translation.width > 0 && bOffset <= bWidth - 80){
                        withAnimation{
                            bOffset = gesture.translation.width
                        }
                    }
                }.onEnded{_ in
                   
                    withAnimation{
                        if(bOffset > bWidth / 2 ){
                            bOffset = bWidth - 80
                            playSound(sound: "success", type: "m4a")
                        }else{
                            bOffset = 0
                        }
                    }
                    
                }
                )
            }.frame(width: bWidth, height: 80 ).background(.blue).mask(Capsule())
            
        }.padding(.vertical , 10).preferredColorScheme(.light)    }
}

#Preview {
    ContentView()
}
