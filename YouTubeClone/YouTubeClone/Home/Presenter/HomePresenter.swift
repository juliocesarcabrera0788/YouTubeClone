//
//  HomePresenter.swift
//  YouTubeClone
//
//  Created by Julio Cabrera on 2024-02-21.
//

import Foundation

protocol HomeViewProtocol:AnyObject{
    func getData(list: [[Any]])
}

class HomePresenter{
    
    var provider : HomeProviderProtocol
    weak var delegate : HomeViewProtocol?
    private var objectList :[[Any]] = []
    
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
        
        async let channel = try await provider.getChannel(channelId: Constants.channelId).items
        async let playlist = try await provider.getPlaylists(channelId: Constants.channelId).items
        async let videos = try await provider.getVideos(searchString: "", channelId: Constants.channelId).items
        
        do{
            let (responseChannel, responsePlaylist, responseVideo) =  await (try channel, try playlist, try videos)
            
            objectList.append(responseChannel)
          
            if let playlistId = responsePlaylist.first?.id, let playlistItems = await getPlaylistItems(playlistId: playlistId){
                objectList.append(playlistItems.items)
            }
            
            objectList.append(responseVideo)
            
            objectList.append(responsePlaylist)
            
            
            delegate?.getData(list: objectList)
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

