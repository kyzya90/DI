//
//  Story2Assembly.swift
//  DITestApp
//
//  Created by Oleksandr Kazmin on 12/12/19.
//  Copyright © 2019 Oleksandr Kazmin. All rights reserved.
//

import Foundation
import UIKit

protocol Story2AssemblyType {
    var profileScreen: UIViewController { get }
    var feedScreen: UIViewController { get }
}

class Story2Assembly: Story2AssemblyType {
    lazy var profileScreen: UIViewController = {
        return UIViewController()
    }()
    
    lazy var feedScreen: UIViewController = {
        return UIViewController()
    }()
}
