//
//  ListViewController + Methods.swift
//  Lesson 10 - Simple Table with AR
//
//  Created by Иван longrail on 11/04/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

extension ListViewController {
    
    func saveProducts() {
        // TODO: save the meals
    }
    
    func loadProducts() -> [Product] {
        return Product.load()
    }
}
