//
//  InitialViewController.swift
//  DITestApp
//
//  Created by Oleksandr Kazmin on 12/12/19.
//  Copyright © 2019 Oleksandr Kazmin. All rights reserved.
//

import Foundation
import UIKit

protocol InitialViewControllerDelegate: class {
    func viewDidTapNextButton(_ view: InitialViewController)
}

class InitialViewController: UIViewController {
    weak var delegate: InitialViewControllerDelegate?
    
    var interactor: InitialInteractorType?
    
    @IBAction func didTapNextButton(_ sender: Any) {
        delegate?.viewDidTapNextButton(self)
    }
}
