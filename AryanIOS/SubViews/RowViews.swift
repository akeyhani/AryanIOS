//
//  RowViews.swift
//  AryanIOS
//
//  Created by Aryan Key on 2025-03-31.
//

import SwiftUI

struct RowView: View {
    var show: Show
    var body: some View {
        
        //RowView
        HStack{
            
            //image
            AsyncImage(url: URL(string: show.artworkUrl100)){
                result in if let image = result.image{ image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height:70)
                } else if result.error != nil{
                
                    Image(systemName: "popcorn.fill")
                } else {
                    ProgressView()
                }
            }
            
            VStack(alignment: .leading){
                
                //name
                Text(show.trackName)
                    .font(.headline)
                
                //genre
                Text(show.primaryGenreName)
                    .font(.callout)
                
                Text(show.shortDescription ?? "No descripton is found")
                
            }
        }
        .padding(.horizontal)
        .frame(height: 100.0)
    }
}

#Preview {
    RowView(show: Show.exampleShow)
}
