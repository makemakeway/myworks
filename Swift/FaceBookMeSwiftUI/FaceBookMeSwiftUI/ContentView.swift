//
//  ContentView.swift
//  FaceBookMeSwiftUI
//
//  Created by 박연배 on 2021/06/15.
//

import SwiftUI

struct ContentView: View {
    var naviColor = UIColor(displayP3Red: 86/255, green: 111/255, blue: 166/255, alpha: 1.0)
    // 네비게이션 영역에 사용할 색상 지정.
    // UIColor(displayP3Red: 86.0, green: 111.0, blue: 166.0, alpha: 1.0) 형식으로 작성하면 색상이 적용이 안됨
    
    let aboutMeCells = [
        Cellinfo(text: "Friends", image: "fb_friends"),
        Cellinfo(text: "Events", image: "fb_events"),
        Cellinfo(text: "Groups", image: "fb_groups"),
        Cellinfo(text: "CMU", image: "fb_education"),
        Cellinfo(text: "Town Hall", image: "fb_town_hall"),
        Cellinfo(text: "Instant Games", image: "fb_games")
    ]
    // Cellinfo에 들어갈 값을 담아둔 리스트를 선언
    
    let settingCells = [
        Cellinfo(text: "Settings", image: "fb_settings"),
        Cellinfo(text: "Privacy Shortcuts", image: "fb_privacy_shortcuts"),
        Cellinfo(text: "Help and Support", image: "fb_help_and_support")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                // PROFILE PART
                
                
                ProfileCell()
                    .background(Color.white)
                    .padding(.vertical, 36)
                    .shadow(color: .gray, radius: 0.6)
                
                
                // ABOUT ME CELL PART
                
                VStack(spacing:0) {
                    ForEach(aboutMeCells) { cell in //ForEach문을 사용하여 ViewCellRow에 Cellinfo의 데이터를 넘겨줌
                        ViewCellRow(cell: cell)
                    }
                    .border(Color(.systemGray4), width: 0.2)
                    .foregroundColor(.black)
                    
                    
                    LinkCell(cell: Cellinfo(text: "See More...", image: "fb_placeholder"))
                        .foregroundColor(Color(red: 0.232, green: 0.349, blue: 0.596))
                        .background(Color.white)
                        .shadow(color: .gray, radius: 0.4)
                }
                .background(Color.white)
                .shadow(color: .gray, radius: 0.4)
                
                // FAVORITES PART
                
                HStack {
                    Text("FAVORITES")
                        .foregroundColor(Color(.systemGray))
                        .font(.system(size: 15))
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.bottom, 4)
                .padding(.horizontal)
                
                LinkCell(cell: Cellinfo(text: "Add Favorites...", image: "fb_placeholder"))
                    .foregroundColor(Color(red: 0.232, green: 0.349, blue: 0.596))
                    .background(Color.white)
                    .shadow(color: .gray, radius: 0.6)
                
                Spacer()
                
                // SETTING CELLS PART
                
                VStack(spacing:0) {
                    ForEach(settingCells) { cell in 
                        ViewCellRow(cell: cell)
                    }
                    .border(Color(.systemGray4), width: 0.2)
                    .foregroundColor(.black)
                }
                .background(Color.white)
                .padding(.vertical, 28)
                .shadow(color: .gray, radius: 0.6)
                
                
                // LOGOUT PART
                

                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Spacer()

                        Text("Log Out")
                            .font(.body)
                            .foregroundColor(Color(.red))

                        Spacer()
                    })
                }
                .frame(height: 50)
                .background(Color(.white))
                .padding(.vertical, 20)
                .shadow(color: .gray, radius: 0.6)
                
                
            }
            .background(Color(.systemGray6))
            .navigationBarTitle("Facebook", displayMode: .inline)
            .navigationColor(naviColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
