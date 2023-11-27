//
//  ProgressView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/26/23.
//

import SwiftUI

struct ProgressPageView: View {
    
    // create view model for opening screen
    var body: some View {
        GeometryReader { geometry in
            VStack{
                
                HStack{
                    

                    ProgressWheel()
                        .frame(width: 120, height: 112)
                        .offset( x: 30, y: 75)
        
                    
                    Spacer()
                    
                    // circle background here
                    ProgressWheel()
                        .frame(width: 110, height: 108)
                        .offset( x: -15, y: 0)
                    
                }.padding(.vertical, 20.0)
                
                
                
                
                HStack{
                    Image("progresscat")
                        .resizable()
                        .frame(width: 296, height: 283)
                }
                .padding(.vertical, 80.0)
                
                
                
                HStack{
                    // HSTACK here with offset
                    
                    
                    ProgressWheel()
                        .frame(width: 110, height: 108)
                        .offset( x: 20, y: -55)
                    
                    Spacer()
                    
                    
                    ProgressWheel()
                        .frame(width: 110, height: 108)
                        .offset( x: 20, y: 25)
                    
                } .padding([.bottom, .trailing], 30)
                
            }
            .padding(.horizontal, 10.0)
            
        }
        .background(Color(UIColor.background)
            .ignoresSafeArea())
    }
}


//struct ProgressPageView: View {
//    var body: some View {
//        GeometryReader { geometry in
//            VStack{
//                ProgressWheel()
//            }
//        }
//        .background(Color(UIColor.background)
//            .ignoresSafeArea())     }
//}

struct ProgressWheel: View {
    
    // sets up progress cap to ten
    @State private var progress = 7.0
    
    var body: some View {
        ZStack{
            //empty progress circle
            VStack{
                ProgressView(value: 10.0, total: 10.0)
                    .progressViewStyle(CircleProgress(strokeColor: Color.pink))
                    .frame(width: UIScreen.main.bounds.width/2)
            }
            
            //actual progress
            ProgressView(value: progress, total: 7.0)
                .progressViewStyle(CircleProgress())
                .frame(width: UIScreen.main.bounds.width/2)
            
            //displays number of tasks completed
            Text(String(format:"%.1f", progress))
                .foregroundColor(.accent)
                .font(.largeTitle)
        }
        
    }
    
}

struct CircleProgress: ProgressViewStyle {
    
    var strokeColor = Color.tomato
    func makeBody(configuration: Configuration) -> some View {
        
        return ZStack {
            Circle()
                .stroke(strokeColor, style: StrokeStyle(lineWidth: 20, lineCap: .square))
                .rotationEffect(.degrees(90))
        }
    }
}


#Preview {
    ProgressPageView()
}
