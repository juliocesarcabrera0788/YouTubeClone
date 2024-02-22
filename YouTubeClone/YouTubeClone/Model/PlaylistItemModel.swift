//
//  PlaylistItem.swift
//  YouTubeClone
//
//  Created by Julio Cabrera on 2024-02-21.
//

import Foundation

// MARK: - PlaylistItem
struct PlaylistItemModel: Decodable {
    let kind, etag: String
    let items: [Item]
    let pageInfo: PageInfo
    
    // MARK: - Item
    struct Item: Decodable {
        let kind, etag, id: String
        let snippet: Snippet
        
        
        // MARK: - Snippet
        struct Snippet: Decodable {
            let publishedAt: String
            let channelId, title, description: String
            let thumbnails: Thumbnails
            let channelTitle, playlistId: String
            let position: Int
            let resourceId: ResourceID
            let videoOwnerChannelTitle, videoOwnerChannelId: String

            enum CodingKeys: String, CodingKey {
                case publishedAt
                case channelId
                case title, description, thumbnails, channelTitle
                case playlistId
                case position
                case resourceId
                case videoOwnerChannelTitle
                case videoOwnerChannelId
            }
            
            // MARK: - Thumbnails
            struct Thumbnails: Decodable {
                let medium: Default
                let high: Default

                enum CodingKeys: String, CodingKey {
                    case medium
                    case high
                }
                
                
                // MARK: - Default
                struct Default: Decodable {
                    let url: String
                    let width: Int
                    let height: Int
                }

            }
            
            // MARK: - ResourceID
            struct ResourceID: Decodable {
                let kind, videoId: String
                
                enum CodingKeys: String, CodingKey {
                    case kind
                    case videoId
                }
            }
        }
    }
    
    // MARK: - PageInfo
    struct PageInfo: Decodable {
        let totalResults, resultsPerPage: Int
    }
    
}










