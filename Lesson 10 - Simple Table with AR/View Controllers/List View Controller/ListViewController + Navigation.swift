//
//  ListViewController + Navigation.swift
//  Lesson 10 - Simple Table with AR
//
//  Created by Иван longrail on 11/04/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//
import UIKit

extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detailSegue" else { return }
        let detailController = segue.destination as! DetailViewController
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailController.product = products[indexPath.row]
        detailController.startImage = endImage!

        tableView.deselectRow(at: indexPath, animated: false)
    }
}
