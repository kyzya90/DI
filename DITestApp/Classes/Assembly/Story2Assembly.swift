//
//  Story2Assembly.swift
//  DITestApp
//
//  Created by Oleksandr Kazmin on 12/12/19.
//  Copyright © 2019 Oleksandr Kazmin. All rights reserved.
//

import Foundation
import UIKit
import Swinject

protocol Story2AssemblyType {
    var profileScreen: UIViewController { get }
    var feedScreen: UIViewController { get }
}

class Story2Assembly: Story2AssemblyType {
    
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    lazy var profileScreen: UIViewController = {
        guard let networkService = container.resolve(NetworkServiceType.self)
        else { fatalError("could not get networkService") }
        guard let storageService = container.resolve(StorageServiceType.self)
        else { fatalError("could not get storageService") }
        let interactor = InititalInteractor(networkService: networkService,
                                            storageService: storageService)
        return UIViewController()
    }()
    
    lazy var feedScreen: UIViewController = {
        guard let networkService = container.resolve(NetworkServiceType.self)
        else { fatalError("could not get networkService") }
        guard let storageService = container.resolve(StorageServiceType.self)
        else { fatalError("could not get storageService") }
        let interactor = InititalInteractor(networkService: networkService,
                                            storageService: storageService)
        return UIViewController()
    }()
}
