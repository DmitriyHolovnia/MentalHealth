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
        setupUI()
        viewControllers = createViewControllers()
        selectedIndex = 0
    }
    
    func setupUI() {
        tabBar.tintColor = .darkGreen
        tabBar.backgroundColor = .white
        tabBar.layer.shadowOffset = .zero
        tabBar.layer.shadowRadius = 2.0
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
    }

    func createViewControllers() -> [UIViewController] {
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "Головна",
                                         image: UIImage(named: "home"),
                                         selectedImage: UIImage(named: "home")?.withTintColor(.darkGreen, renderingMode: .alwaysOriginal))
        
        let progessViewModel = ProgressViewModel()
        let progressView = ProgressView().environmentObject(progessViewModel)
        let progressVC = UIHostingController(rootView: progressView)
        progressVC.tabBarItem = UITabBarItem(title: "Прогрес",
                                             image: UIImage(named: "progress"),
                                             selectedImage: UIImage(named: "progress")?.withTintColor(.darkGreen, renderingMode: .alwaysOriginal))
        
        let blogVC = BlogVC()
        blogVC.tabBarItem = UITabBarItem(title: "Спільноти",
                                         image: UIImage(named: "community"),
                                         selectedImage: UIImage(named: "community")?.withTintColor(.darkGreen, renderingMode: .alwaysOriginal))
        
        let opportunitiesViewModel = OpportunitiesViewModel()
        let opportunitiesVC = OpportunitiesVC(viewModel: opportunitiesViewModel)
        opportunitiesVC.tabBarItem = UITabBarItem(title: "Можливості",
                                                  image: UIImage(named: "opportunities"),
                                                  selectedImage: UIImage(named: "opportunities")?.withTintColor(.darkGreen, renderingMode: .alwaysOriginal))
        
        let profileVC = ProfileVC()
        profileVC.tabBarItem = UITabBarItem(title: "Профіль",
                                            image: UIImage(named: "profile"),
                                            selectedImage: UIImage(named: "profile")?.withTintColor(.darkGreen, renderingMode: .alwaysOriginal))
        
        return [homeVC, progressVC, blogVC, opportunitiesVC, profileVC]
    }

}

struct TabBarView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> TabBarVC {
        TabBarVC()
    }
    
    func updateUIViewController(_ uiViewController: TabBarVC, context: Context) {
        
    }
    
}
