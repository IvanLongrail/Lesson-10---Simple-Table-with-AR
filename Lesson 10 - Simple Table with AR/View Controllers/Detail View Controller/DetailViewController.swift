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
    @IBOutlet weak var helpingLabel: UILabel!
    @IBOutlet weak var startImageView:UIImageView!
    
    var helpingText = "Searching a surface" {
        didSet{
            helpingLabel.text = helpingText
        }
    }
    
    var startImage: UIImage? // for animation
    var product: Product?
    
    var focusSquare = FocusSquare()
    var focusSquareHide = false {
        didSet {
            UIView.animate(withDuration: 0.5) {
                if self.focusSquareHide {
                    self.helpingLabel.alpha = 0
                } else {
                    self.helpingLabel.alpha = 1
                }
            }
        }
    }
    var screenCenter: CGPoint {
        let bounds = self.sceneView.bounds
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.startImageView.alpha = 0
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.5, animations: {
            self.priceLabel.alpha = 1
            self.nameLabel.alpha = 1
            self.categoryLabel.alpha = 1
            self.popularityRatingLabel.alpha = 1
            self.helpingLabel.alpha = 1
            self.sceneView.alpha = 1
        }, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}

