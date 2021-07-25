//
//  ContentView.swift
//  MovieSearch
//
//  Created by 박연배 on 2021/07/13.
//

import SwiftUI

struct ContentView: View {
    @State var searchInput: String = ""
    @State var searchToggle: Bool = false
    @ObservedObject var movieListViewModel: MovieListViewModel = MovieListViewModel()
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemIndigo).edgesIgnoringSafeArea(.all)
                VStack {
                    Text("영화 검색")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    Text("영화 제목을 입력하세요.")
                        .font(.title3)
                        .foregroundColor(.gray)
                    TextField("", text: $searchInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    NavigationLink(
                        destination: SearchResultView(searchInput: $searchInput, movies: self.movieListViewModel.movies),
                        isActive: $searchToggle,
                        label: {
                            Button("검색") {
                                self.searchToggle.toggle()
                                movieListViewModel.searchByName(searchInput)
                            }
                            .frame(width: 60, height: 30)
                            .background(Color.white)
                            .foregroundColor(Color(.systemIndigo))
                            .clipShape(Capsule())
                        })
                    
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
