//
//  AppDelegate.swift
//  DITestApp
//
//  Created by Oleksandr Kazmin on 12/12/19.
//  Copyright © 2019 Oleksandr Kazmin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private let applicationAssembly = ApplicationAssembly()
    private lazy var router = {
        return Router(assembly: applicationAssembly.storyAssembly)
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        router.window = window
        router.showInitialScreen()
        return true
    }
}

