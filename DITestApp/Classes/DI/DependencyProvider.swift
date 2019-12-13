//
//  DependencyProvider.swift
//  DITestApp
//
//  Created by Oleksandr Kazmin on 12/13/19.
//  Copyright © 2019 Oleksandr Kazmin. All rights reserved.
//

import Foundation
import Swinject

protocol DependencyProviderType {
    var storyContainer: StoryContainer { get }
    var story2Container: Story2Container { get }
}

class DependencyProvider {
    
    internal lazy var container: DependencyContainer = {
        let container = filledContainer(with: Container())
        return DependencyContainer(container: container)
    }()
    
    class DependencyContainer: GlobalContainer {
        private let container: Container
        
        init(container: Container) {
            self.container = container
        }
        
        var networkService: NetworkServiceType {
            return object()
        }
        
        var storageService: StorageServiceType {
            return object()
        }
        
        func object<T>() -> T {
            guard let object = container.resolve(T.self)
            else { fatalError("could not find dependency \(T.self)") }
            return object
        }
    }
    
    func filledContainer(with container: Container) -> Container {
        container.register(NetworkServiceType.self) { _ -> NetworkServiceType in
            return NetworkService()
        }.inObjectScope(.container)
        
        container.register(StorageServiceType.self) { _ -> StorageServiceType in
            return StorageService()
        }.inObjectScope(.container)
        
        return container
    }
}

extension DependencyProvider: DependencyProviderType {
    var storyContainer: StoryContainer {
        return container
    }
    
    var story2Container: Story2Container {
        return container
    }
}
