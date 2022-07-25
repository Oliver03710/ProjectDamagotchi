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
        
        damagotchiLabel.text = name
        damagotchiLabel.layer.borderColor = UIColor.fontAndBorderColor().cgColor
        damagotchiLabel.layer.borderWidth = 1
        damagotchiLabel.clipsToBounds = true
        damagotchiLabel.layer.cornerRadius = 4
        damagotchiLabel.font = .boldSystemFont(ofSize: 12)
        damagotchiLabel.textColor = .fontAndBorderColor()
        damagotchiLabel.textAlignment = .center
        damagotchiLabel.numberOfLines = 0
    }
}
