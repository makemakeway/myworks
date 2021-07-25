//
//  SearchResultView.swift
//  MovieSearch
//
//  Created by 박연배 on 2021/07/13.
//

import SwiftUI

struct SearchResultView: View {
    @Binding var searchInput: String
    @Environment(\.presentationMode) var mode
    let movies: [MovieViewModel]
    
    
    var body: some View {
        
        ZStack {
            Color(.systemIndigo).edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    HStack {
                        Button(action: { mode.wrappedValue.dismiss() }, label: {
                            Image(systemName: "chevron.left")
                        })
                        .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .padding()
                    
                    
                    
                    ForEach(self.movies, id: \.link) { movie in
                        Link(destination: URL(string: movie.link)!, label: {
                            SearchCell(movie: movie)
                        })
                        
                    }
                    
                    
                    
                }
                .frame(maxWidth: .infinity)
            }
            
            
        }
    }
}

//struct SearchResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultView(searchInput: .constant("String"), movieListViewModel: MovieListViewModel(), movie: <#[MovieViewModel]#>)
//    }
//}
