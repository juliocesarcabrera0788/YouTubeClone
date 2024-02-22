//
//  ChannelModel.swift
//  YouTubeClone
//
//  Created by Julio Cabrera on 2024-02-21.
//

import Foundation

// MARK: - ChannelModel
struct ChannelModel: Codable {
    let kind, etag: String
    let pageInfo: PageInfo
    let items: [Item]
    
    // MARK: - PageInfo
    struct PageInfo: Codable {
        let totalResults, resultsPerPage: Int
    }

    
    // MARK: - Item
    struct Item: Codable {
        let kind, etag, id: String
        let snippet: Snippet
        
        
        // MARK: - Snippet
        struct Snippet: Codable {
            let title, description, customUrl, publishedAt: String
            let thumbnails: Thumbnails
            let defaultLanguage: String
            let localized: Localized
            let country: String

            enum CodingKeys: String, CodingKey {
                case title, description
                case customUrl
                case publishedAt, thumbnails, defaultLanguage, localized, country
            }
            
            // MARK: - Thumbnails
            struct Thumbnails: Codable {
                let thumbnailsDefault, medium, high: Default

                enum CodingKeys: String, CodingKey {
                    case thumbnailsDefault = "default"
                    case medium, high
                }
                
                
                // MARK: - Default
                struct Default: Codable {
                    let url: String
                    let width, height: Int
                }
            }
            
            // MARK: - Localized
            struct Localized: Codable {
                let title, description: String
            }
        }
    }
}











