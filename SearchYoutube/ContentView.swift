//
//  ContentView.swift
//  SearchYoutube
//
//  Created by 星優大 on 2023/02/17.
//

import SwiftUI
import GoogleSignIn

struct ContentView: View {
    @State var results:Results?
    @State private var keyword = "One Peace"
    @ObservedObject var searcher = YoutubeSearcher()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("検索文字列", text: $keyword)
                        .font(.system(size: 30))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button(action: {
                        self.searcher.search(keyword: self.keyword)
                    }) {
                        Text("検索").foregroundColor(.white)
                    }
                    .background(
                        Capsule()
                            .foregroundColor(.blue)
                            .frame(width: 70, height: 40))
                        .padding(25)
                }
                Spacer()
                if self.searcher.results != nil {
                    List {
                        ForEach(self.searcher.results!.items) {item in
                            // 画像表示領域とNavigationLinkを重ねる
                            ZStack{
                                // 画像・テキスト表示領域
                                VideoRowView(title: item.snippet.title, imgURL: item.snippet.thumbnails.default.url, description: item.snippet.description)
                                // NavigationLink
                                NavigationLink(destination: YoutubeView(url: "https://www.youtube.com/watch?v=" + item.vid.videoId)) {
                                    // EmptyViewでディフォルトで表示される矢印を非表示
                                    EmptyView()
                                }.opacity(0)
                            }

                        }
                    }
                }
            }
            .navigationBarTitle("検索画面")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
