//
//  DependencyProvider.swift
//  DITestApp
//
//  Created by Oleksandr Kazmin on 12/13/19.
//  Copyright © 2019 Oleksandr Kazmin. All rights reserved.
//

import Foundation

protocol DependencyProviderType {
    var storyContainer: StoryContainer { get }
    var story2Container: Story2Container { get }
}

class DependencyProvider {
    
    internal lazy var container: DependencyContainer = {
        return DependencyContainer()
    }()
    
    class DependencyContainer: GlobalContainer {
        
        internal let networkService: NetworkServiceType = NetworkService()
        internal let storageService: StorageServiceType = StorageService()
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
