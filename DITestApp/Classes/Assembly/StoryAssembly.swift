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
    var initialViewController: UIViewController { get }
    var secondViewController: UIViewController { get }
}

class StoryAssembly: StoryAssemblyType {
    lazy var initialViewController: UIViewController = {
        return UIViewController()
    }()
    
    lazy var secondViewController: UIViewController = {
        return UIViewController()
    }()
}
