

import SwiftUI

struct ContentView: View {
    
    var contentUrl = "https://www.reddit.com"
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        ZStack{
            
            VStack {
                NavigationView {
                    List(networkManager.posts) { post in
                        
                        NavigationLink(destination: DetailView(url: contentUrl + post.permalink)) {
                            HStack {
                                Text(String(post.ups))
                                VStack {
                                    
                                
                                    Text(post.title )
                                        .fixedSize(horizontal: false, vertical: true)
                                        
                                    AsyncImage(url: URL(string: post.thumbnail)){ image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: .infinity, height: 90)
                                        
                                    } placeholder: {
                                        
                                        Color.clear
                                            .frame(width: 0, height: 0)
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    
                                }
                               
                                
                            }
                        }
                    }.navigationTitle("REDDIT HITS")
                    .onAppear {
                        self.networkManager.fetchData()
                    }
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

