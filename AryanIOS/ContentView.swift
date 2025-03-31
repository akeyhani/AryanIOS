//
//  ContentView.swift
//  AryanIOS
//
//  Created by Aryan Key on 2025-03-31.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText  = "Breaking bad"
    
 
    @State private var shows: [Show] = []
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List {
                    // List the shows
                    ForEach(shows) { show in NavigationLink(destination: DetailView(show: show)) {
                            RowView(show: show)
                        }
                    }
                    
                }
                .navigationBarTitle("My Show List")
                .onAppear(){
                    loadData(usingShowName: searchText)
                }
                .searchable(text: $searchText, prompt: "Enter show name")
                .keyboardType(.default)
                .onSubmit(of: .search, {
                    loadData(usingShowName: searchText)
                })
            }
        }
    }
    
    //MARK: - Search function
    func loadData(usingShowName showName: String){
        Task{
            guard let cleanText = showName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else { return }
            let urlString = "https://itunes.apple.com/search?term=\(cleanText)&media=tvShow"

            guard let url = URL(string: urlString) else {
                return
            }
            
            do{
                let (data, _) =  try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                let results = try decoder.decode(Shows.self, from: data)
                shows = results.results
                
            } catch DecodingError.valueNotFound(let error, let message){
               print( "Value is missing: \(error) - \(message.debugDescription)")
            } catch DecodingError.typeMismatch(let error, let message){
                print( "Types do not match: \(error)- \(message.debugDescription)")
            } catch DecodingError.keyNotFound(let error, let message){
               print( "Incorrect property name: \(error)- \(message.debugDescription)")
            } catch {
               print( "Unknown error has occurred- \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    ContentView()
}
