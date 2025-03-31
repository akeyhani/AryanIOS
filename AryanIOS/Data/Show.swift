//
//  Show.swift
//  AryanIOS
//
//  Created by Aryan Key on 2025-03-31.
//

import Foundation

struct Shows: Codable {
    var resultCount: Int
    var results: [Show]
}

struct Show: Codable, Identifiable {
    static var exampleShow = Show(trackId: 689796287,artistName: "Breaking Bad",collectionName: "Breaking Bad, Deluxe Edition: The Final Season",trackName: "Buried",artistViewUrl: "https://itunes.apple.com/us/tv-show/breaking-bad/id271382034?uo=4",collectionViewUrl: "https://itunes.apple.com/us/tv-season/buried/id665386598?i=689796287&uo=4",trackViewUrl: "https://itunes.apple.com/us/tv-season/buried/id665386598?i=689796287&uo=4",artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Video128/v4/78/1e/8d/781e8df5-3a72-edba-6b57-c41d57a4ad48/mzl.pyqdnvcv.lsr/100x100bb.jpg",collectionExplicitness: "notExplicit",primaryGenreName: "Drama",shortDescription: "While Skyler's past catches up with her, Walt covers his tracks. Jesse continues to struggle with",longDescription: "While Skyler's past catches up with her, Walt covers his tracks. Jesse continues to struggle with his guilt.")
    
    var id: String { return String(trackId) }
    var trackId: Int
    var artistName: String
    var collectionName: String
    var trackName: String
    var artistViewUrl: String
    var collectionViewUrl: String
    var trackViewUrl: String
    var artworkUrl100: String
    var collectionExplicitness: String
    var primaryGenreName: String
    var shortDescription: String?
    var longDescription: String
}

//This decodes the json file and also checks for any errors
extension Bundle {
    func decode(_ file: String) -> Shows {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Can't locate this file")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Can't convert the url to data")
        }
        guard let shows = try? JSONDecoder().decode(Shows.self, from: data) else {
            fatalError("Can't decode - problem with keys and properties or values")
        }
        return shows
    }
}



    
