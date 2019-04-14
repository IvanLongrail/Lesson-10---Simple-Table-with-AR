//
//  DetailViewController + Custom Methods.swift
//  Lesson 10 - Simple Table with AR
//
//  Created by Иван longrail on 14/04/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import ARKit

// MARK: - Custom Setup Methods
extension DetailViewController {
    
    func setupUI() {
        
        guard let product = product else { return }
        guard let startImage = startImage else { return }
        
        priceLabel.text = product.priceString
        nameLabel.text = product.name
        categoryLabel.text = product.category.rawValue
        popularityRatingLabel.text = product.popularityRatingString
        startImageView.image = startImage
        
        startImageView.alpha = 1 // for animation
        
        let scene = SCNScene()
        sceneView.scene = scene
        sceneView.autoenablesDefaultLighting = true
        
        sceneView.delegate = self
    }
}
