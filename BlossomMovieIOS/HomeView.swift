//
//  HomeView.swift
//  BlossomMovieIOS
//
//  Created by Troy Fitzgerald on 12/27/25.
//

import SwiftUI

struct HomeView: View {
    var heroTestTitle = Constants.testTitleURL
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: heroTestTitle)) {image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
        }
        
    }
}
// test now with my branch from github

#Preview {
    HomeView()
}
