//
//  AlertController.swift
//  Activities
//
//  Created by Alisa Ts on 26.11.2021.
//

import UIKit

extension SearchViewController {
    func presentSearchAlertController(withTitle title: String, message: String, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addTextField { tf in
            let names = ["Peter", "Alexey", "Mark", "Anna", "Alice"]
            tf.placeholder = names.randomElement()
        }
        
        let search = UIAlertAction(title: "Search", style: .default) { action in
            
            let textField = alert.textFields?.first
            guard let genderName = textField?.text else { return }
            if genderName != "" {
                let name = genderName.split(separator: " ").joined(separator: "%20")
                completionHandler(name)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(search)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
