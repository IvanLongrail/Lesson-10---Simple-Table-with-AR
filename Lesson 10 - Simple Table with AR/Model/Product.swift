//
//  Product.swift
//  Lesson 10 - Simple Table with AR
//
//  Created by Иван longrail on 11/04/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import ARKit

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
        let image = renderer.snapshot(atTime: renderTime, with: size,
                                  antialiasingMode: SCNAntialiasingMode.multisampling4X)
        
        return image
    }
    
    enum category: String {
        case chair = "Chair"
        case desk  = "Desk"
        case vase  = "Vase"
    }
}
