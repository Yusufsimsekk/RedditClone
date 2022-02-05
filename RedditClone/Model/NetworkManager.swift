import Foundation

class NetworkManager: ObservableObject {
    
    var postData = [Subtitles]()
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://www.reddit.com/r/flutterdev/top.json?count=20") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                self.posts = [Post](repeating: Post.init(created: 0, permalink: "", thumbnail: "", url: "", ups: 0, title: ""), count: results.data.children.count)
                                print(results.data.children[10].data)
//                                self.postData = results.data.children
                                for i in 0...results.data.children.count-1 {
                                    self.posts[i] = results.data.children[i].data
                                }
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
