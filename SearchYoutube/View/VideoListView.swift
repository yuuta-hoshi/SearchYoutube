//
//  VideoListView.swift
//  SearchYoutube
//
//  Created by 星優大 on 2023/02/18.
//

import SwiftUI
import GoogleAPIClientForREST

struct VideoListView: View {
  @State var videos: [GTLRYouTube_SearchResult] = []

  var body: some View {
    List(videos, id: \.identifier) { video in
      VideoRow(video: video)
    }
    .onAppear(perform: loadVideos)
  }

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
struct VideoRow: View {
  var video: GTLRYouTube_SearchResult

  var body: some View {
    HStack {
      // Display the video's thumbnail image
      ImageView(url: video.snippet.thumbnails.defaultProperty.url)
        .frame(width: 50, height: 50)

      // Display the video's title and description
      VStack(alignment: .leading) {
        Text(video.snippet.title)
          .font(.headline)
        Text(video.snippet.descriptionProperty)
          .font(.subheadline)
      }
    }
  }
}

struct ImageView: View {
  let url: String

  var body: some View {
    return ImageStore.shared.image(url: url)
  }
}
func loadVideos() {
    // Replace YOUR_API_KEY with your actual API key
    let apiKey = "YOUR_API_KEY"

    // Set up the YouTube API service
    let service = GTLRYouTubeService()
    service.apiKey = apiKey

    // Set up the search query
    let query = GTLRYouTubeQuery_SearchList.query(withPart: "id,snippet")
    query.q = "swiftui"
    query.maxResults = 50

    // Make the API call
    service.executeQuery(query) { (ticket, response, error) in
      if let error = error {
        // Handle the error
      } else {
        self.videos = (response as! GTLRYouTube_SearchListResponse).items ?? []
      }
    }
  }
}
