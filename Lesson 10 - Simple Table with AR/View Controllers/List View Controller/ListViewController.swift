//
//  ListViewController.swift
//  Lesson 10 - Simple Table with AR
//
//  Created by Иван longrail on 11/04/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import UIKit
import ARKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var blackBackgroundView: UIView!
    @IBOutlet weak var blackView: UIView!
 
    
    var image = UIImage()
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        products = loadProducts()
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        //configuration.planeDetection = [.horizontal]
        
        // Run the view's session
        sceneView.session.run(configuration)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animate(withDuration: 1, animations: {
            self.view.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 3, animations: {
            self.blackBackgroundView.backgroundColor = .clear
        }, completion: nil)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
}

// MARK: - Custom Methods
extension ListViewController {
    func setupUI() {
        view.alpha = 0
        
        tableView.dataSource = self
        blackView.isOpaque = true
        
        makeTableЕransparent()
        
        let scene = SCNScene()
        sceneView.scene = scene
        //sceneView.alpha = 0
        
        //addBlurEffect()
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
