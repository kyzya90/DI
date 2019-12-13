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
    
    private let networkService: NetworkServiceType
    private let storageService: StorageServiceType
    
    init(networkService: NetworkServiceType,
         storageService: StorageServiceType) {
        self.networkService = networkService
        self.storageService = storageService
    }
    
    func fetchFromNetwork() {
        networkService.loadItems {[weak self] (items) in
            self?.saveToDb()
        }
    }
    
    func saveToDb() {
        
    }
}
