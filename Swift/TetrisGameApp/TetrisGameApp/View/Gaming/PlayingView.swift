//
//  PlayingView.swift
//  TetrisGameApp
//
//  Created by 박연배 on 2021/08/31.
//

import SwiftUI

struct PlayingView: View {
    var body: some View {
        ZStack {
            Color.black
            GeometryReader { geo in
                VStack(alignment: .center) {
                    HStack(alignment: .top) {
                        BoardView(width: geo.size.width*0.7, height: geo.size.height*0.7)
                        
                        VStack {
                            Text("NEXT")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                            Rectangle().stroke(Color.gray, lineWidth: 5)
                                .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.1)
                            
                            Text("POINTS")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                            Text("0000000")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                        }
                        .padding(.top, 40)
                        .padding(.trailing)
                    }
                    
                    HStack(spacing: 32) {
                        Button(action: {  }, label: {
                            Text("<")
                        })
                        .frame(width: 54, height: 54)
                        .background(Color.gray)
                        .clipShape(Circle())
                        
                        Button(action: {  }, label: {
                            Text(">")
                        })
                        .frame(width: 54, height: 54)
                        .background(Color.gray)
                        .clipShape(Circle())
                        
                        Spacer()
                    }
                    .font(.system(size: 50, weight: .semibold))
                    .foregroundColor(.white)
                }
            }
            
        }
        .ignoresSafeArea()
    }
}

struct PlayingView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingView()
    }
}
