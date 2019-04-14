//
//  DetailViewController + Custom Methods.swift
//  Lesson 10 - Simple Table with AR
//
//  Created by Иван longrail on 14/04/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import ARKit


// MARK: - Custom Methods For Creating 3D Objects
extension DetailViewController {
    
    func createPlane(planeAnchor: ARPlaneAnchor) -> SCNNode {
        let extent = planeAnchor.extent
        
        let node = SCNNode()
        
        let planeNode = SCNNode()
        let plane = SCNPlane(width: CGFloat(extent.x), height: CGFloat(extent.z))
        plane.firstMaterial?.diffuse.contents = UIColor.blue
        planeNode.geometry = plane
        
        
        planeNode.name = "Plane"
        planeNode.eulerAngles.x = -.pi / 2
        planeNode.opacity = 0
        
        
        node.addChildNode(planeNode)
        
        node.addChildNode(product!.scene.rootNode.childNodes.first! )
        
        return node
    }
    
    func updatePlaneNode(with planeNode: SCNNode, for anchor: ARPlaneAnchor ) {
        planeNode.position = SCNVector3(anchor.center.x, 0, anchor.center.z)
        let extent = anchor.extent
        let plane = planeNode.geometry as! SCNPlane
        plane.width = CGFloat(extent.x)
        plane.height = CGFloat(extent.z)
    }
}
