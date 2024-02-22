//
//  HomeViewController.swift
//  YouTubeClone
//
//  Created by Julio Cabrera on 2024-02-21.
//

import UIKit

class HomeViewController: UIViewController {

    
    lazy var presenter = HomePresenter(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Task{
            await presenter.getHomeObjects()
        }
        
        
    }
    
}

extension HomeViewController : HomeViewProtocol {
    
    func getData(list: [[Any]]) {
        print("list: ", list)
    }
}
