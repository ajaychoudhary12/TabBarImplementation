//
//  SceneDelegate.swift
//  TabBar
//
//  Created by Ajay Choudhary on 04/04/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let viewController = getTabBar()
        window.rootViewController = viewController

        self.window = window
        window.makeKeyAndVisible()
    }
    
    func getTabBar() -> RootNavigationController {
        let viewControllerOne = UINavigationController(rootViewController: ViewControllerOne()) 
        let viewControllerTwo = ViewControllerTwo()
        
        let items = [
            TabBarItemView(
                viewModel: TabBarItemViewModel(
                    title: "Home",
                    image: UIImage(named: "home"),
                    index: 0,
//                    animationURL:  URL(string: "https://assets9.lottiefiles.com/packages/lf20_jyylm3x9.json"),
                    selectedImage: UIImage(named: "home_filled"),
                    isSelected: true
                )
            ),
            TabBarItemView(
                viewModel: TabBarItemViewModel(
                    title: "Away",
                    image: UIImage(named: "envelope"),
                    index: 1,
                    selectedImage: UIImage(named: "envelope_filled")
                )
            ),
        ]
        
        let tabBarViewModel = TabBarViewModel(
            items: items,
            viewControllers: [viewControllerOne, viewControllerTwo]
        )
        let tabBarController = TabBarController(viewModel: tabBarViewModel)
        tabBarViewModel.controllerActions = tabBarController
        return tabBarController
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

