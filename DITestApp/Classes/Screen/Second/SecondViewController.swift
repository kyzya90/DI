//
//  SecondViewController.swift
//  DITestApp
//
//  Created by Oleksandr Kazmin on 12/12/19.
//  Copyright © 2019 Oleksandr Kazmin. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    var interactor: SecondInteractorType?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchFromNetwork()
    }
}
