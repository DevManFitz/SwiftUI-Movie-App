//
//  HorizontalListView.swift
//  BlossomMovieIOS
//
//  Created by Troy Fitzgerald on 1/1/26.
//

import SwiftUI

struct HorizontalListView: View {
    let header : String
    var titles = [Constants.testTitleURL, Constants.testTitleURL2, Constants.testTitleURL3]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.title)
            
            ScrollView (.horizontal) {
                LazyHStack {
                    ForEach(titles, id:\.self) { title in
                        AsyncImage(url: URL(string: title)){image in
                            image // modifiers for movie images
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 200)
                    }
                }
            }
        }
        .frame(height: 250)
        .padding(10)
        
    }
}

#Preview {
    HorizontalListView(header: Constants.trendingMovieString)
}
