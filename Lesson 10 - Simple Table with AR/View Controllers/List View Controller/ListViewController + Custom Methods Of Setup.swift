//
//  ListViewController + Methods.swift
//  Lesson 10 - Simple Table with AR
//
//  Created by Иван longrail on 11/04/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import ARKit

// MARK: - Custom Setup Methods
extension ListViewController {
    
    func saveProducts() {
        // TODO: save the meals
    }
    
    func loadProducts() -> [Product] {
        return Product.load()
    }
    
    func setupUI() {
        view.alpha = 0 // for animation
        
        tableView.dataSource = self
        tableView.delegate = self
        makeTableЕransparent()
        
        
        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    func makeTableЕransparent() {
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
    }
    
    //    func addBlurEffect() {
    //        let darkBlur = UIBlurEffect(style: .dark)
    //        let blurView = UIVisualEffectView(effect: darkBlur)
    //        blurView.frame = sceneView.bounds
    //        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    //        sceneView.addSubview(blurView)
    //    }
    

    
}


