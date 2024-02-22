//
//  ChannelModel.swift
//  YouTubeClone
//
//  Created by Julio Cabrera on 2024-02-21.
//

import Foundation

// MARK: - ChannelModel
struct ChannelModel: Decodable {
    let kind: String
    let etag: String
    let pageInfo: PageInfo
    let items: [Item]
    
    // MARK: - PageInfo
    struct PageInfo: Decodable {
        let totalResults, resultsPerPage: Int
    }

    
    // MARK: - Item
    struct Item: Decodable {
        let kind: String
        let etag: String
        let id: String
        let snippet: Snippet
        let statistics: Statistics?
        let brandingSettings : BrandingSettings?
        
                
        // MARK: - Snippet
        struct Snippet: Decodable {
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
            struct Thumbnails: Decodable {
                let thumbnailsDefault, medium, high: Default

                enum CodingKeys: String, CodingKey {
                    case thumbnailsDefault = "default"
                    case medium, high
                }
                
                
                // MARK: - Default
                struct Default: Decodable {
                    let url: String
                    let width, height: Int
                }
            }
            
            // MARK: - Localized
            struct Localized: Decodable {
                let title, description: String
            }
        }
        struct Statistics : Decodable {
                let viewCount: String
                let subscriberCount: String
                let hiddenSubscriberCount: Bool
                let videoCount: String
        }
        
        struct BrandingSettings : Decodable {
            let channel:Channel
            let image:Image
        }
        
        struct Channel : Decodable {
            let title : String
            let description: String
            let keywords: String
            let defaultLanguage: String
            let country: String
        }
        
        struct Image: Decodable{
            let bannerExternalUrl:String
        }

        
    }
}











