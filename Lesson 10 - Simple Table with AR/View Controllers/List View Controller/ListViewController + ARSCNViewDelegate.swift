//
//  ListViewController + ARSCNView.swift
//  Lesson 10 - Simple Table with AR
//
//  Created by Иван longrail on 11/04/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import ARKit

extension ListViewController: ARSCNViewDelegate {

}

//extension ListViewController {
//    
//    func createPlane(planeAnchor: ARPlaneAnchor, product: Product) -> SCNNode {
//        let extent = planeAnchor.extent
//        
//        let node = SCNNode()
//        
//        let planeNode = SCNNode()
//        let plane = SCNPlane(width: CGFloat(extent.x), height: CGFloat(extent.z))
//        plane.firstMaterial?.diffuse.contents = UIColor.blue
//        planeNode.geometry = plane
//        
//        
//        planeNode.name = "Plane"
//        planeNode.eulerAngles.x = -.pi / 2
//        planeNode.opacity = 0.6
//       
//        
//        node.addChildNode(planeNode)
//        node.addChildNode(product.node)
//        
//        return node
//    }
//    
//    func updatePlaneNode(with planeNode: SCNNode, for anchor: ARPlaneAnchor ) {
//        planeNode.position = SCNVector3(anchor.center.x, 0, anchor.center.z)
//        let extent = anchor.extent
//        let plane = planeNode.geometry as! SCNPlane
//        plane.width = CGFloat(extent.x)
//        plane.height = CGFloat(extent.z)
//    }
//}
