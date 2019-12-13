//
//  ApplicationAssembly.swift
//  DITestApp
//
//  Created by Oleksandr Kazmin on 12/12/19.
//  Copyright © 2019 Oleksandr Kazmin. All rights reserved.
//

import Foundation
import Swinject

protocol ApplicationAssemblyType {
    var storyAssembly: StoryAssemblyType { get }
    var story2Assembly: Story2AssemblyType { get }
}

class ApplicationAssembly: ApplicationAssemblyType {
    
    private lazy var container: Container = {
        let container = Container()
        registerDependencies(of: container)
        return container
    }()
    
    lazy var storyAssembly: StoryAssemblyType = {
        return StoryAssembly(container: container)
    }()
    
    lazy var story2Assembly: Story2AssemblyType = {
        return Story2Assembly(container: container)
    }()
    
    private func registerDependencies(of container: Container) {
        container.register(NetworkServiceType.self) { _ -> NetworkServiceType in
            return NetworkService()
        }.inObjectScope(.container)
        
        container.register(StorageServiceType.self) { _ -> StorageServiceType in
            return StorageService()
        }.inObjectScope(.container)
    }
}
