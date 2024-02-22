//
//  HomeProviderMock.swift
//  YouTubeClone
//
//  Created by Julio Cabrera on 2024-02-22.
//

import Foundation


class HomeProviderMock: HomeProviderProtocol {
    
    func getVideos(searchString: String, channelId: String) async throws -> VideoModel {
        guard let model = Utils.parseJson(jsonName: "SearchVideos", model: VideoModel.self) else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
    func getChannel(channelId: String) async throws -> ChannelModel {
        guard let model = Utils.parseJson(jsonName: "Channel", model: ChannelModel.self) else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
    func getPlaylists(channelId: String) async throws -> PlaylistModel {
        guard let model = Utils.parseJson(jsonName: "Playlists", model: PlaylistModel.self) else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
    func getPlaylistsItems(playlistId: String) async throws -> PlaylistItemModel {
        guard let model = Utils.parseJson(jsonName: "PlaylistItems", model: PlaylistItemModel.self) else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
   
 
    
    
}
