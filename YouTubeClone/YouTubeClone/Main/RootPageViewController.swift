//
//  RootPageViewController.swift
//  YouTubeClone
//
//  Created by Julio Cabrera on 2024-02-21.
//

import UIKit



protocol RootPageProtocol : AnyObject{
    func currentPage(_ index:Int)
}

class RootPageViewController: UIPageViewController {
    
    var subViewController = [UIViewController]()
    var currentIndex = 0
    weak var delegateRoot:RootPageProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            delegate = self
            dataSource = self
        setupViewController()
    }
    
    private func setupViewController(){
        subViewController = [
            HomeViewController(),
            VideosViewController(),
            PlaylistsViewController(),
            ChannelsViewController(),
            AboutViewController()
        ]
        
        _ = subViewController.enumerated().map({$0.element.view.tag = $0.offset})
        
        setViewControllerFromIndex(index: 0, direction: .forward)
    }
    
    func setViewControllerFromIndex(index:Int, direction:NavigationDirection, animated:Bool = true){
        setViewControllers([subViewController[index]], direction: direction, animated: animated)
    }
    
}

extension RootPageViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        subViewController.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = subViewController.firstIndex(of: viewController) ?? 0
        if index <= 0 {
            return nil
        }
        
        return subViewController[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
       
        let index = subViewController.firstIndex(of: viewController) ?? 0
        
        if index >= (subViewController.count - 1) {
            return nil
        }
        
        return subViewController[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("finished: ", finished)
        if let index = pageViewController.viewControllers?.first?.view.tag{
            currentIndex = index
            delegateRoot?.currentPage(index)
        }
    }
    
    
}
