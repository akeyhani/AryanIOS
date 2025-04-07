import SwiftUI

struct DetailView: View {
    var show: Show
    @EnvironmentObject var watchlist: WatchlistStore
    @State private var showingAlert = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading){

                    // Show title name
                    Text(show.trackName)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // Collection name
                    Text(show.collectionName)

                    if show.collectionExplicitness == "notExplicit" {
                        Image(systemName: "checkmark.circle.fill")
                    } else {
                        Image(systemName: "18.circle.fill")
                    }
                }

                // Show image
                AsyncImage(url: URL(string: show.artworkUrl100)) { result in
                    if let image = result.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 110, height: 130)
                    } else if result.error != nil {
                        Image(systemName: "popcorn.circle")
                    } else {
                        ProgressView()
                    }
                }
            }

            Divider()

            // genre
            Text("Genre: ")
                .fontWeight(.bold) +
            Text(show.primaryGenreName)

            // description
            Text("Description: ")
                .fontWeight(.bold) +
            Text(show.longDescription)

            // learn more
            NavigationLink(destination: WebView(webText: show.trackViewUrl)) {
                Label("Learn More", systemImage: "link.circle.fill")
            }

            // add to watchlist button
            Button {
                showingAlert = true
            } label: {
                Label("Add to Watchlist", systemImage: "heart.fill")
                    .foregroundColor(.blue)
            }
            .padding(.top)
            .alert("Add \(show.trackName) to watchlist?", isPresented: $showingAlert) {
                Button("Add") {
                    watchlist.add(show)
                }
                Button("Cancel", role: .cancel) {}
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    DetailView(show: Show.exampleShow)
        .environmentObject(WatchlistStore())
}
