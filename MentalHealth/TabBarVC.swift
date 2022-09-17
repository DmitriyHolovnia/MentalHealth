//
//  TabBarVC.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import UIKit
import SwiftUI

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = createViewControllers()
    }
    
    // Home, Progress, Opportunities, Blog, Profile
    func createViewControllers() -> [UIViewController] {
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
        
        let progessViewModel = ProgressViewModel()
        let progressView = ProgressView().environmentObject(progessViewModel)
        let progressVC = UIHostingController(rootView: progressView)
        progressVC.tabBarItem = UITabBarItem(title: "Progress", image: nil, tag: 1)
        
        let opportunitiesVC = OpportunitiesVC()
        opportunitiesVC.tabBarItem = UITabBarItem(title: "Opportunities", image: nil, tag: 2)
        
        let blogVC = BlogVC()
        blogVC.tabBarItem = UITabBarItem(title: "Blog", image: nil, tag: 3)
        
        let profileVC = ProfileVC()
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 4)
        
        return [homeVC, progressVC, opportunitiesVC, blogVC, profileVC]
    }

}
