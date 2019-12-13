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
    var story2Assembly: Story2AssemblyType { get }
}

class ApplicationAssembly: ApplicationAssemblyType {
    
    lazy var storyAssembly: StoryAssemblyType = {
        return StoryAssembly()
    }()
    
    lazy var story2Assembly: Story2AssemblyType = {
        return Story2Assembly()
    }()
}
