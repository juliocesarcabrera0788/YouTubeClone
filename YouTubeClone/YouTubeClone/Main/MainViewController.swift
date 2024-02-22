//
//  MainViewController.swift
//  YouTubeClone
//
//  Created by Julio Cabrera on 2024-02-21.
//

import UIKit

class MainViewController: UIViewController {
    
    var rootPageViewController:RootPageViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? RootPageViewController{
            destination.delegateRoot = self
            rootPageViewController = destination
        }
        
    }
    
}

extension MainViewController : RootPageProtocol {
    func currentPage(_ index: Int) {
        print("Current Page: ", index)
    }
    
    
}
