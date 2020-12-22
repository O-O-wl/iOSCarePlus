//
//  File.swift
//  iOSCarePlus
//
//  Created by dongyoung.lee on 2020/12/16.
//

import Foundation

enum NewGame {
    struct Response: Decodable {
        let contents: [Content]
        let length: Int
        let offset: Int
        let total: Int
    }
    
    struct Content: Decodable {
        let id: Int
        let name: String
        let bannerURL: String
        let screenshots: [ScreenShot]
        
        enum CodingKeys: String, CodingKey {
            case id
            case name = "formal_name"
            case bannerURL = "hero_banner_url"
            case screenshots
        }
    }
    
    struct ScreenShot: Decodable {
        let images: [Image]
    }
    
    struct Image: Decodable {
        let url: String
    }
}
