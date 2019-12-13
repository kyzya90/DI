//
//  NetworkService.swift
//  DITestApp
//
//  Created by Oleksandr Kazmin on 12/12/19.
//  Copyright © 2019 Oleksandr Kazmin. All rights reserved.
//

import Foundation

protocol NetworkServiceType {
    func loadItems(completion: @escaping ([String]) -> Void)
}

class NetworkService: NetworkServiceType {
    func loadItems(completion: @escaping ([String]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(["1", "2", "3"])
        }
    }
}
