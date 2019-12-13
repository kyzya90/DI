//
//  Router.swift
//  DITestApp
//
//  Created by Oleksandr Kazmin on 12/12/19.
//  Copyright © 2019 Oleksandr Kazmin. All rights reserved.
//

import Foundation
import UIKit

protocol RouterType {
    func showSecondScreen(animated: Bool)
    func showInitialScreen()
}


class Router: RouterType {
    
    private let assembly: StoryAssemblyType
    var window: UIWindow?
    var navigationController: UINavigationController?
    
    init(assembly: StoryAssemblyType) {
        self.assembly = assembly
    }
    
    func showInitialScreen() {
        let viewController = assembly.initialViewController
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.delegate = self
        self.navigationController = navigationController
        window?.rootViewController = navigationController
    }
    
    func showSecondScreen(animated: Bool) {
        let viewController = assembly.secondViewController
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    deinit {
        print("deinited")
    }
}

extension Router: InitialViewControllerDelegate {
    func viewDidTapNextButton(_ view: InitialViewController) {
        showSecondScreen(animated: true)
    }
}
