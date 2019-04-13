//
//  Product.swift
//  Lesson 10 - Simple Table with AR
//
//  Created by Иван longrail on 11/04/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import ARKit

/// Struct of ytable element
struct Product {
    var name: String
    var category: category
    var price: Int
    var scene: SCNScene
    
    var popularityRating: Int {
        return loadRating()
    }
    
    var priceString: String {
        let string = String(price) + "$"
        return string
    }
    
    var popularityRatingString: String {
        let string = "Purchased " + String(popularityRating) + " times"
        return string
    }
    
    var sceneImage: UIImage {
        let renderer = SCNRenderer(device: MTLCreateSystemDefaultDevice(), options: nil)
        renderer.scene = scene
        
        let renderTime = TimeInterval(0)
        
        // Output size
        let size = CGSize(width: 100, height: 100)
        
        // Render the image
        return renderer.snapshot(atTime: renderTime, with: size,
                                  antialiasingMode: SCNAntialiasingMode.multisampling4X)
    }
    
    enum category: String {
        case chair = "Chair"
        case desk  = "Desk"
        case vase  = "Vase"
    }
}


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

