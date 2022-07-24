//
//  ChoiceCollectionViewController.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/23.
//

import UIKit

class ChoiceCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    
    static let identifier = "ChoiceCollectionViewController"
    
    let collectionMonster = DamagotchiData()
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        configureCells()
    }
    
    
    // MARK: - Selectors
    
    
    // MARK: - Helper Functions
    
    func configureNavi() {
        navigationItem.title = "다마고치 선택하기"
    }
    
    func configureCells() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)
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
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharactersCollectionViewCell", for: indexPath) as? CharactersCollectionViewCell else { return UICollectionViewCell() }
        
        
        switch indexPath.row {
        case 0:
            cell.configureCellDetails(inputImage: "\(collectionMonster.damas[indexPath.row].characterClass)-\(collectionMonster.damas[indexPath.row].level[5])", name: collectionMonster.damas[indexPath.row].name)
        case 1:
            cell.configureCellDetails(inputImage: "\(collectionMonster.damas[indexPath.row].characterClass)-\(collectionMonster.damas[indexPath.row].level[5])", name: collectionMonster.damas[indexPath.row].name)
        case 2:
            cell.configureCellDetails(inputImage: "\(collectionMonster.damas[indexPath.row].characterClass)-\(collectionMonster.damas[indexPath.row].level[5])", name: collectionMonster.damas[indexPath.row].name)
        default:
            cell.configureCellDetails(inputImage: "noImage", name: "준비중이에요")
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as? DetailViewController else { return }
        vc.modalPresentationStyle = .overCurrentContext
        
        if UserDefaults.standard.object(forKey: "Character") != nil {
            if indexPath.row >= 0, indexPath.row < 3 {
                vc.detailMonster = collectionMonster.damas[indexPath.row]
            } else {
                return
            }
        } else {
            if indexPath.row >= 0, indexPath.row < 3 {
                vc.detailMonster = collectionMonster.damas[indexPath.row]
            } else {
                return
            }
        }

        present(vc, animated: true)
    }


}
