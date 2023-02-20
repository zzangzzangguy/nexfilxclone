//
//  YoutubeSearchResponse.swift
//  netflix clone2
//
//  Created by 김기현 on 2023/02/19.
//

import Foundation


struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdvideoElement
}


struct IdvideoElement: Codable {
    let kind: String
    let videoId: String
}
