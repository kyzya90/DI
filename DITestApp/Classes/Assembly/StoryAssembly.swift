//
//  StoryAssembly.swift
//  DITestApp
//
//  Created by Oleksandr Kazmin on 12/12/19.
//  Copyright © 2019 Oleksandr Kazmin. All rights reserved.
//

import Foundation
import UIKit
import Swinject

protocol StoryAssemblyType {
    var initialViewController: InitialViewController { get }
    var secondViewController: SecondViewController { get }
}

class StoryAssembly: StoryAssemblyType {
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    lazy var initialViewController: InitialViewController = {
        let initialViewController: InitialViewController = self.viewController()
        guard let networkService = container.resolve(NetworkServiceType.self)
        else { fatalError("could not get networkService") }
        guard let storageService = container.resolve(StorageServiceType.self)
        else { fatalError("could not get storageService") }
        let interactor = InititalInteractor(networkService: networkService,
                                            storageService: storageService)
        initialViewController.interactor = interactor
        return initialViewController
    }()
    
    lazy var secondViewController: SecondViewController = {
        let secondVC: SecondViewController = self.viewController()
        let initialViewController: InitialViewController = self.viewController()
        guard let networkService = container.resolve(NetworkServiceType.self)
        else { fatalError("could not get networkService") }
        guard let storageService = container.resolve(StorageServiceType.self)
        else { fatalError("could not get storageService") }
        let interactor = SecondInteractor(networkService: networkService,
                                          storageService: storageService)
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
