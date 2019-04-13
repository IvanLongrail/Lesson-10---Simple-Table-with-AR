//
//  ViewController.swift
//  Lesson 10 - Simple Table with AR
//
//  Created by Иван longrail on 11/04/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import ARKit

class DetailViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var popularityRatingLabel: UILabel!
    
    //var listViewController: ListViewController?
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}

// MARK: - Custom Methods
extension DetailViewController {
    
    func setupUI() {
        // Set the view's delegate
        
        
        guard let product = product else { return }
        
        priceLabel.text = product.priceString
        nameLabel.text = product.name
        categoryLabel.text = product.category.rawValue
        popularityRatingLabel.text = product.popularityRatingString
        
        let scene = SCNScene()
      
        sceneView.scene = scene
        
        sceneView.delegate = self
        //sceneView.session.delegate = listViewController
        
        //sceneView.session = listViewController!.sceneView.session
    }
}


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

extension DetailViewController {
    
    func createPlane(planeAnchor: ARPlaneAnchor) -> SCNNode {//, product: Product) -> SCNNode {
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
