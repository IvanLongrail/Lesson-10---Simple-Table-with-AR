//
//  ListViewController + Table.swift
//  Lesson 10 - Simple Table with AR
//
//  Created by Иван longrail on 11/04/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import UIKit


// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let product = products[row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        
        setup(cell, with: product)
        
        return cell
        
    }

}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let layer = UIApplication.shared.keyWindow?.layer else { return }
        let renderer = UIGraphicsImageRenderer(size: layer.frame.size)
        endImage = renderer.image(actions: { context in
            layer.render(in: context.cgContext)
        })
        
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
}


// MARK: - Setup Custom Methods
extension ListViewController {
    
    func setup(_ cell: UITableViewCell, with product: Product ) {  
        cell.detailTextLabel?.text = product.category.rawValue
        cell.textLabel?.text = product.name
        cell.imageView?.image = product.sceneImage
    }
}
