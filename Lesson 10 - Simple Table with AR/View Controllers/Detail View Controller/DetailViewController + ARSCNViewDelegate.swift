//
//  DetailViewController + ARSCNViewDelegate.swift
//  Lesson 10 - Simple Table with AR
//
//  Created by Иван longrail on 14/04/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import ARKit

extension DetailViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard sceneView.scene.rootNode.childNode(withName: "Plane", recursively: true) == nil else { return }
        guard let anchor = anchor as? ARPlaneAnchor else { return }
        
        node.addChildNode(createPlane(planeAnchor: anchor))
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor ) {
        guard let anchor = anchor as? ARPlaneAnchor else { return }
        guard node.childNodes.first != nil else { return }
        guard let planeNode = node.childNodes.first?.childNodes.first else { return }
        guard let _ = planeNode.geometry as? SCNPlane else { return }
        guard planeNode.name == "Plane" else { return }
        
        updatePlaneNode(with: planeNode, for: anchor)
    }
}
