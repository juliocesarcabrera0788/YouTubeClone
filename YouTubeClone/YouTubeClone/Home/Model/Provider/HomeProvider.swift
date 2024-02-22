//
//  HomeProvider.swift
//  YouTubeClone
//
//  Created by Julio Cabrera on 2024-02-21.
//

import Foundation


protocol HomeProviderProtocol{
    func getVideos(searchString:String, channelId:String) async throws -> VideoModel
    func getChannel(channelId:String) async throws -> ChannelModel
    func getPlaylists(channelId:String) async throws -> PlaylistModel
    func getPlaylistsItems(playlistId:String) async throws -> PlaylistItemModel
}

class HomeProvider:HomeProviderProtocol{
    
    func getVideos(searchString:String, channelId:String) async throws -> VideoModel{
        var queryParams:[String:String] = ["part":"snippet", "type":"video"]
        if !channelId.isEmpty{
            queryParams["channelId"] = channelId
        }
        if !searchString.isEmpty{
            queryParams["q"] = searchString
        }
        let requetModel = RequestModel(endpoint: .search, queryItems: queryParams)
        
        do{
            let model = try await ServiceLayer.callService(requetModel, VideoModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
        
    }
    
    
    func getChannel(channelId:String) async throws -> ChannelModel{
        var queryParams:[String:String] = ["part":"snippet,statistics,brandingSettings",
                                           "id":channelId]
        
        let requetModel = RequestModel(endpoint: .channels, queryItems: queryParams)
        
        do{
            let model = try await ServiceLayer.callService(requetModel, ChannelModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
    
    
    func getPlaylists(channelId:String) async throws -> PlaylistModel{
        var queryParams:[String:String] = ["part":"snippet,contentDetails",
                                           "channelId":channelId]
        
        let requetModel = RequestModel(endpoint: .playlists, queryItems: queryParams)
        
        do{
            let model = try await ServiceLayer.callService(requetModel, PlaylistModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
    
    
    func getPlaylistsItems(playlistId:String) async throws -> PlaylistItemModel{
        var queryParams:[String:String] = ["part":"snippet,id,contentDetails",
                                           "playlistId":playlistId]
        
        let requetModel = RequestModel(endpoint: .playlistsItems, queryItems: queryParams)
        
        do{
            let model = try await ServiceLayer.callService(requetModel, PlaylistItemModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
    
    
    
}
