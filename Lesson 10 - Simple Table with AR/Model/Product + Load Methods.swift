//
//  Product + Load Methods.swift
//  Lesson 10 - Simple Table with AR
//
//  Created by Иван longrail on 14/04/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import ARKit

// MARK: - Loads Methods
extension Product {
    
    static func load() -> [Product]{
        return [
            Product(name: "Стол", category:  .desk, price: 100,
                    scene: SCNScene(named: "art.scnassets/Normal Object/table/round table Ultimate(free Final).scn")! ),
            Product(name: "Табурет", category: .chair, price: 10,
                    scene: SCNScene(named: "art.scnassets/Normal Object/24-taburetka/Taburetka.scn")! ),
            
            Product(name: "Кожаный стул", category: .chair, price: 87,
                    scene: SCNScene(named: "art.scnassets/Normal Object/black chair/black chair.scn")! ),
            
            Product(name: "Ваза простая", category:  .vase, price:  7,
                    scene: SCNScene(named: "art.scnassets/Normal Object/vase/vase.scn")! ),
            
            Product(name: "Ваза", category:  .vase, price:  30,
                    scene: SCNScene(named: "art.scnassets/Normal Object/vase 2/HSM0042.scn")! )
        ]
    }
    
    func loadRating() -> Int {
        var currentRating = 0
        switch self.category {
        case .chair:
            currentRating = 13
        case .desk:
            currentRating = 4
        case .vase:
            currentRating = 28
        }
        return currentRating
    }
    
}

