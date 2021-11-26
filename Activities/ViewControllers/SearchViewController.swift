//
//  SearchViewController.swift
//  Activities
//
//  Created by Alisa Ts on 26.11.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet var imgGender: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    
    var networkNameManager = NetworkNameManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkNameManager.onCompletion = { currentName in
            self.updateInterfaceWith(name: currentName)
        }
        networkNameManager.fetchCurrentName(forName: "Peter")
    }
    
    @IBAction func searchName(_ sender: Any) {
        self.presentSearchAlertController(withTitle: "Enter Name", message: "", style: .alert) { name in
            self.networkNameManager.fetchCurrentName(forName: name)
        }
    }
    
    func updateInterfaceWith(name: CurrentName) {
        DispatchQueue.main.async {
            self.nameLabel.text = name.personNameCapitalized
            self.genderLabel.text = name.personGender
            self.imgGender.image = UIImage(named: name.imageGender)
        }
    }
}
