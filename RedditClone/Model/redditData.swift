

import Foundation

struct Results : Decodable {
    let data : Titles
}
struct Titles : Decodable {
    let children : [Subtitles]
}
struct Subtitles : Decodable {
    let data : Post
}

struct Post : Identifiable, Decodable {
    var id : String{
        return String(Int(created))
    }
    let created: Double
    let permalink: String
    let thumbnail: String
    let url: String
    let ups : Int
    let title : String
}
