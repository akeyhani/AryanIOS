//
//  DetailView.swift
//  AryanIOS
//
//  Created by Aryan Key on 2025-03-31.
//

import SwiftUI

struct DetailView: View {
    var show: Show
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading){
                    
                    //Show title name
                    Text(show.trackName)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //Collection name
                    Text(show.collectionName)
                    
                    if (show.collectionExplicitness == "notExplicit"){
                        Image(systemName: "checkmark.circle.fill")
                    }else {
                        Image(systemName: "18.circle.fill")
                    }
                }
                //Show image
                AsyncImage(url: URL(string: show.artworkUrl100)){
                    result in if let image = result.image{ image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110, height:130)
                    } else if result.error != nil{
                
                        Image(systemName: "popcorn.circle")
                    } else {
                        ProgressView()
                    }
                }
            }
            
            Divider()
            
            //Show Genre type
            Text("Genre: ")
                .fontWeight(.bold) +
            Text(show.primaryGenreName)
            
            //Description about the show
            Text("Descripion: ")
                .fontWeight(.bold) +
            Text(show.longDescription)
            
            NavigationLink(destination: WebView(webText: show.trackViewUrl)) {
                Label("Learn More", systemImage: "link.circle.fill")
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    DetailView(show: Show.exampleShow)
}
