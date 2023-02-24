//
//  VideoRowView.swift
//  SearchYoutube
//
//  Created by 星優大 on 2023/02/20.
//

import SwiftUI


struct VideoRowView: View {
    @State var title: String
    let imgURL: String
    @State var description: String
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: imgURL)!) {image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 250)
            HStack{
                VStack{
                    Text(title)
                        .font(.headline)
                        .lineLimit(1)
                    Text(description)
                        .font(.caption)
                        .lineLimit(2)
                }
            }
        }
    }
}

struct VideoRowView_Previews: PreviewProvider {
    static var previews: some View {
        VideoRowView(title: "タイトル", imgURL: "https://o2-m.com/dog1.png", description: "これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。これは動画の説明です。")
    }
}
