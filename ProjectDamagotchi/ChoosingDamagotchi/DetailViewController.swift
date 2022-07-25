//
//  DetailViewController.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/23.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Properties
    
    static let identifier = "DetailViewController"
    
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var portraitImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var introductionLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var acceptButton: UIButton!
    
    var detailMonster: Damagotchi?
    
    let introArr = ["저는 따끔따끔 다마고치입니당. 몸에 독을 품고 있으니 함부로 건들면 다쳐요!",
                    "저는 방실방실 다마고치입니당. 아주아주 뜨거운 아이에요! 체온은 10,000ºC까지 올라가요!",
                    "저는 반짝반짝 다마고치입니당. 너무 빛나서 저를 직접 보면 실명해요!"]
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Helper Functions
    
    func configureUI() {
        centerView.backgroundColor = .backgroundColor()
        centerView.clipsToBounds = true
        centerView.layer.cornerRadius = 10
        
        guard let monster = detailMonster else { return }
        portraitImageView.image = UIImage(named: "\(monster.characterClass)-\(monster.level[5])")
        
        configureNameLabel()
        configureIntroductionLabel()
        configureButtons()
    }
    
    
    func configureNameLabel() {
        guard let monster = detailMonster else { return }
        characterNameLabel.text = monster.name
        characterNameLabel.layer.borderColor = UIColor.fontAndBorderColor().cgColor
        characterNameLabel.layer.borderWidth = 1
        characterNameLabel.clipsToBounds = true
        characterNameLabel.layer.cornerRadius = 2
        characterNameLabel.font = .systemFont(ofSize: 14)
        characterNameLabel.textColor = .fontAndBorderColor()
        characterNameLabel.textAlignment = .center
        characterNameLabel.numberOfLines = 0
    }
    
    
    func configureIntroductionLabel() {
        guard let monster = detailMonster else { return }
        
        switch monster.name {
        case "따끔따끔 다마고치":
            introductionLabel.text = introArr[0]
        case "방실방실 다마고치":
            introductionLabel.text = introArr[1]
        case "반짝반짝 다마고치":
            introductionLabel.text = introArr[2]
        default:
            break
        }
        
        introductionLabel.layer.borderColor = UIColor.fontAndBorderColor().cgColor
        introductionLabel.font = .systemFont(ofSize: 14)
        introductionLabel.textColor = .fontAndBorderColor()
        introductionLabel.textAlignment = .center
        introductionLabel.numberOfLines = 0
    }
    
    
    func configureButtons() {
        
        if UserDefaults.standard.object(forKey: "Character") != nil {
            acceptButton.setTitle("변경하기", for: .normal)
        } else {
            acceptButton.setTitle("시작하기", for: .normal)
        }
        acceptButton.backgroundColor = .backgroundColor()
        acceptButton.titleLabel?.font = .systemFont(ofSize: 15)
        acceptButton.setTitleColor(UIColor.fontAndBorderColor(), for: .normal)
        
        cancelButton.backgroundColor = .systemGray6
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 15)
        cancelButton.setTitleColor(UIColor.fontAndBorderColor(), for: .normal)
    }
    
    
    // MARK: - IBActions
    
    @IBAction func acceptButtonTapped(_ sender: UIButton) {
        
        UserDefaults.standard.set(true, forKey: "Intro")
        
        guard let monster = detailMonster else { return }
        
        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(monster) else { return }
        let defaults = UserDefaults.standard
        defaults.set(encoded, forKey: "Character")
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: MainViewController.identifier) as? MainViewController else { return }
        let nav = UINavigationController(rootViewController: vc)
        
        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
        
        if acceptButton.titleLabel?.text == "변경하기" {
            nav.view.alpha = 0.0
            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut]) {
                nav.view.alpha = 1.0
            }
        }
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
