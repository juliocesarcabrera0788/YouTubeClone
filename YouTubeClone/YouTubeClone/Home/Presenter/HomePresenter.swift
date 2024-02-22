//
//  HomePresenter.swift
//  YouTubeClone
//
//  Created by Julio Cabrera on 2024-02-21.
//

import Foundation

protocol HomeViewProtocol:AnyObject{
    func getData(list: [[Any]], sectionTitleList : [String])
}

class HomePresenter{
    
    var provider : HomeProviderProtocol
    weak var delegate : HomeViewProtocol?
    private var objectList :[[Any]] = []
    private var sectionTitleList : [String] = []
    
    init(delegate : HomeViewProtocol, provider: HomeProviderProtocol = HomeProvider()) {
        self.provider = provider
        self.delegate = delegate
        #if DEBUG
        if MockManager.shared.runAppWithMock{
            self.provider = HomeProviderMock()
        }
        #endif
       
    }
    
    func getHomeObjects() async{
        
        objectList.removeAll()
        sectionTitleList.removeAll()
        
        
        async let channel = try await provider.getChannel(channelId: Constants.channelId).items
        async let playlist = try await provider.getPlaylists(channelId: Constants.channelId).items
        async let videos = try await provider.getVideos(searchString: "", channelId: Constants.channelId).items
        
        do{
            let (responseChannel, responsePlaylist, responseVideo) =  await (try channel, try playlist, try videos)
            
            objectList.append(responseChannel)
            sectionTitleList.append("")
            
            if let playlistId = responsePlaylist.first?.id, let playlistItems = await getPlaylistItems(playlistId: playlistId){
                objectList.append(playlistItems.items.filter({$0.snippet.title != "Private video"}))
                sectionTitleList.append(responsePlaylist.first?.snippet.title ?? "")
                
            }
            
            objectList.append(responseVideo)
            sectionTitleList.append("Uploads")
            
            objectList.append(responsePlaylist)
            sectionTitleList.append("Created playlists")
            
            
            delegate?.getData(list: objectList, sectionTitleList: sectionTitleList)
        }catch{
            print(error)
        }
        
    }
    
    
    func getPlaylistItems(playlistId:String) async -> PlaylistItemModel?{
        do{
            let playlistItem = try await provider.getPlaylistsItems(playlistId: playlistId)
            return playlistItem
        }catch{
            print(error)
            return nil
        }
            
    }
    
}

