//
//  ApplicationAssembly.swift
//  DITestApp
//
//  Created by Oleksandr Kazmin on 12/12/19.
//  Copyright © 2019 Oleksandr Kazmin. All rights reserved.
//

import Foundation
protocol ApplicationAssemblyType {
    var storyAssembly: StoryAssemblyType { get }
}

class ApplicationAssembly: ApplicationAssemblyType {
    lazy var storyAssembly: StoryAssemblyType = {
        return StoryAssembly()
    }()
}
