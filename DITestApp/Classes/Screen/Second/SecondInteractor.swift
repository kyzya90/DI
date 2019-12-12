//
//  SecondInteractor.swift
//  DITestApp
//
//  Created by Oleksandr Kazmin on 12/12/19.
//  Copyright © 2019 Oleksandr Kazmin. All rights reserved.
//

import Foundation
protocol SecondInteractorType {
    func fetchFromNetwork()
    func saveToDb()
}

class SecondInteractor: SecondInteractorType {
    func fetchFromNetwork() {
    }
    
    func saveToDb() {
    }
}
