//
//  CharactersCollectionViewCell.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/23.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var damagotchiImageView: UIImageView!
    @IBOutlet weak var damagotchiLabel: UILabel!
    
    
    // MARK: - Helper Functions
    
    func configureCellDetails(inputImage: String, name: String) {
        
        damagotchiImageView.image = UIImage(named: inputImage)
        damagotchiLabel.setLabels(name: name, fontSize: 12)
    }
}
