//
//  SearchCell.swift
//  MovieSearch
//
//  Created by 박연배 on 2021/07/13.
//

import SwiftUI
import Kingfisher

struct SearchCell: View {
    let movie: MovieViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            KFImage(URL(string: movie.imageURL))
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 100)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(movie.title.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: ""))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .font(.title3)
                
                .padding(.bottom, 1)
                
                HStack {
                    Text("평점: " + movie.userRating)
                        .foregroundColor(.orange)
                    Text("\(movie.pubDate) 개봉")
                        .foregroundColor(.gray)
                }
                
                Text("감독: " + movie.director)
                    .foregroundColor(.white)
                Text("배우: " + movie.actors)
                    .foregroundColor(.white)
                    .lineLimit(1)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .border(Color.gray, width: 0.3)
    }
}

//struct SearchCell_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchCell()
//    }
//}
