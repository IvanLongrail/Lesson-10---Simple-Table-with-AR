//
//  DetailViewController + ARSCNViewDelegate.swift
//  Lesson 10 - Simple Table with AR
//
//  Created by Иван longrail on 14/04/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import ARKit

extension DetailViewController: ARSCNViewDelegate {
 
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        updateFocusSquare()
        
        DispatchQueue.main.async {
            if let result = self.sceneView.smartHitTest(self.screenCenter) {
                
                if let _ = result.anchor as? ARPlaneAnchor {
                    self.helpingText = "Tap to place the product"
                    
                } else {
                    
                    self.helpingText = "Searching a surface"
                }
            }
        }
        
    }
}
