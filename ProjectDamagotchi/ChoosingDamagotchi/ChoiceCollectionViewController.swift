//
//  ChoiceCollectionViewController.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/23.
//

import UIKit

class ChoiceCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    
    let damagotchi = DamagotchiData()
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        configureCells()
    }
    
    
    // MARK: - Helper Functions
    
    func configureNavi() {
        navigationItem.title = "다마고치 선택하기"
    }
    
    func configureCells() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 16
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.3)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }
    
    // MARK: - Collection View Functions
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.identifier, for: indexPath) as? CharactersCollectionViewCell else { return UICollectionViewCell() }
        
        switch indexPath.row {
        case 0...damagotchi.DamagotchiInstances.count - 1:
            cell.configureCellDetails(inputImage: damagotchi.DamagotchiInstances[indexPath.row].basicImages(character:
                                                  damagotchi.DamagotchiInstances[indexPath.row].characterClass),
                                      name: damagotchi.DamagotchiInstances[indexPath.row].name)
        default: cell.configureCellDetails(inputImage: "noImage", name: "준비중이에요")
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: StoryboardName.main.rawValue, bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as? DetailViewController else { return }
        vc.modalPresentationStyle = .overCurrentContext
        
        switch indexPath.row {
        case 0...damagotchi.DamagotchiInstances.count - 1:
            vc.damagotchi = damagotchi.DamagotchiInstances[indexPath.row]
        default: break
        }
        
        present(vc, animated: true)
    }


}
