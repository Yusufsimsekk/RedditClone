//
//  DetailView.swift
//  NEWS
//
//  Created by Yusuf Şimşek on 2.10.2021.
//

import SwiftUI

struct DetailView: View {
    let url : String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
