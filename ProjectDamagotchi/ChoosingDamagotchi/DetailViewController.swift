//
//  DetailViewController.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/23.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var portraitImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var introductionLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var acceptButton: UIButton!
    
    var damagotchi: Damagotchi?

    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Helper Functions
    
    func configureUI() {
        configureCenterView()
        configureImage()
        configureNameLabel()
        configureIntroductionLabel()
        configureButtons()
    }
    
    func refineOptional() -> Damagotchi {
        
        guard let monster = damagotchi else { return Damagotchi(name: "", characterClass: 0) }
        return monster
        
    }
    
    
    func configureCenterView() {
        centerView.backgroundColor = .backgroundColor()
        centerView.clipsToBounds = true
        centerView.layer.cornerRadius = 10
    }
    
    
    func configureImage() {
        portraitImageView.image = UIImage(named: refineOptional().basicImages(character: refineOptional().characterClass))
    }
    
    
    func configureNameLabel() {
        characterNameLabel.setLabels(name: refineOptional().name, fontSize: 14)
    }
    
    
    func configureIntroductionLabel() {
        introductionLabel.text = refineOptional().characterIntroduction(refineOptional().name)
        introductionLabel.setLabels(fontSize: 14)
    }
    
    
    func configureButtons() {
        
        cancelButton.setTitle(Buttons.cancel.rawValue, for: .normal)
        cancelButton.setDetailButtons(color: .systemGray5)
        
        acceptButton.setDetailButtons(color: .backgroundColor())
        
        switch UserdefaultsHelper.standard.character {
        case Optional<Any>.none: return acceptButton.setTitle(Buttons.accept.rawValue, for: .normal)
        default: return acceptButton.setTitle(Buttons.change.rawValue, for: .normal)
        }
    
    }
    
    
    // MARK: - IBActions
    
    @IBAction func acceptButtonTapped(_ sender: UIButton) {
        
        if sender == acceptButton {
            UserdefaultsHelper.standard.intro = true
            
            let encoder = JSONEncoder()
            guard let encoded = try? encoder.encode(refineOptional()) else { return }
            UserdefaultsHelper.standard.character = encoded
            
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            
            let sb = UIStoryboard(name: StoryboardName.main.rawValue, bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: MainViewController.identifier) as? MainViewController else { return }
            let nav = UINavigationController(rootViewController: vc)
            
            sceneDelegate?.window?.rootViewController = nav
            sceneDelegate?.window?.makeKeyAndVisible()
            
        } else {
            self.dismiss(animated: true)
        }

    }

}
