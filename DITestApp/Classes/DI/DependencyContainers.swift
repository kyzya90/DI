//
//  DependencyContainer.swift
//  DITestApp
//
//  Created by Oleksandr Kazmin on 12/13/19.
//  Copyright © 2019 Oleksandr Kazmin. All rights reserved.
//

import Foundation

protocol StoryContainer {
    var networkService: NetworkServiceType { get }
    var storageService: StorageServiceType { get }
}

protocol Story2Container: StoryContainer { }
protocol GlobalContainer: Story2Container {}
