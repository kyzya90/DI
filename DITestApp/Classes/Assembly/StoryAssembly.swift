//
//  StoryAssembly.swift
//  DITestApp
//
//  Created by Oleksandr Kazmin on 12/12/19.
//  Copyright © 2019 Oleksandr Kazmin. All rights reserved.
//

import Foundation
import UIKit

protocol StoryAssemblyType {
    var initialViewController: InitialViewController { get }
    var secondViewController: SecondViewController { get }
}

class StoryAssembly: StoryAssemblyType {
    
    private let container: StoryContainer
    
    init(container: StoryContainer) {
        self.container = container
    }
    
    lazy var initialViewController: InitialViewController = {
        let initialViewController: InitialViewController = self.viewController()
        let interactor = InititalInteractor(networkService: container.networkService,
                                            storageService: container.storageService)
        initialViewController.interactor = interactor
        return initialViewController
    }()
    
    lazy var secondViewController: SecondViewController = {
        let secondVC: SecondViewController = self.viewController()
        let initialViewController: InitialViewController = self.viewController()
        let interactor = SecondInteractor(networkService: container.networkService,
                                          storageService: container.storageService)
        secondVC.interactor = interactor
        return secondVC
    }()
    
    private func viewController<T: UIViewController>(from storyboardName: String = "Main") -> T {
        let storyboard = UIStoryboard(name: storyboardName,
                                      bundle: nil)
        let viewControllerId = T.description().components(separatedBy: ".").last
        guard let requiredViewControllerId = viewControllerId
        else { fatalError("VC doesn't have ID") }
        
        let viewController = storyboard.instantiateViewController(identifier: requiredViewControllerId)
        guard let requiredViewController = viewController as? T
        else {
            fatalError("Could not cast ViewController")
        }
        
        return requiredViewController
    }
}
