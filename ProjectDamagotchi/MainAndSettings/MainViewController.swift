//
//  MainViewController.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/23.
//

import UIKit
import Toast

class MainViewController: UIViewController {

    // MARK: - Properties
    
    static let identifier = "MainViewController"
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var foodTextField: UITextField!
    @IBOutlet weak var foodButton: UIButton!
    
    @IBOutlet weak var waterTextField: UITextField!
    @IBOutlet weak var waterButton: UIButton!
    
    @IBOutlet weak var talkingLabel: UILabel!
    
    let smallTalk = Talks()
    var deathCountArr = [0, 0]  // [food, water]
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Selectors
    
    @objc func showSettings() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: SettingsTableViewController.identifier) as? SettingsTableViewController else { return }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: - Helper Functions
    
    func configureNavi() {
        view.backgroundColor = .backgroundColor()
        self.navigationController?.navigationBar.tintColor = UIColor.fontAndBorderColor()
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .backgroundColor()
//        navigationItem.standardAppearance = barAppearance
        navigationItem.scrollEdgeAppearance = barAppearance
        
        navigationItem.title = "\(UserDefaults.standard.string(forKey: "Naming") ?? "대장님")의 다마고치"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(showSettings))
    }
    
    
    func configureUI() {
        inputImages()
        configureStatus()
        configureNavi()
        configureNameLabel()
        configureTextField()
        configureButtons()
        configureTalkingLabel()
    }
    
    
    func configureStatus() {
        statusLabel.text = "LV\(calculateLevel()) ・ 밥알 \(UserDefaults.standard.integer(forKey: "Food"))개 ・ 물방울 \(UserDefaults.standard.integer(forKey: "Water"))개"
        statusLabel.font = .boldSystemFont(ofSize: 15)
        statusLabel.textColor = .fontAndBorderColor()
    }
    
    
    func configureNameLabel() {
        guard let savedMonster = UserDefaults.standard.object(forKey: "Character") as? Data else { return }
        let decoder = JSONDecoder()
        guard let loadedMonster = try? decoder.decode(Damagotchi.self, from: savedMonster) else { return }
        
        nameLabel.text = "\(loadedMonster.name)"
        nameLabel.layer.borderColor = UIColor.fontAndBorderColor().cgColor
        nameLabel.layer.borderWidth = 1
        nameLabel.clipsToBounds = true
        nameLabel.layer.cornerRadius = 2
        nameLabel.font = .boldSystemFont(ofSize: 15)
        nameLabel.textColor = .fontAndBorderColor()
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
    }
    
    
    func configureTextField() {
        foodTextField.placeholder = "밥주세용"
        foodTextField.textAlignment = .center
        foodTextField.borderStyle = .none
        
        waterTextField.placeholder = "물주세용"
        waterTextField.textAlignment = .center
        waterTextField.borderStyle = .none
    }
    
    
    func configureButtons() {
        foodButton.clipsToBounds = true
        foodButton.layer.cornerRadius = 8
        foodButton.layer.borderWidth = 1
        foodButton.layer.borderColor = UIColor.fontAndBorderColor().cgColor
        foodButton.setTitle(" 밥먹기", for: .normal)
        foodButton.titleLabel?.font = .systemFont(ofSize: 14)
        foodButton.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        foodButton.tintColor = .fontAndBorderColor()
        foodButton.setTitleColor(.fontAndBorderColor(), for: .normal)
        
        waterButton.clipsToBounds = true
        waterButton.layer.cornerRadius = 8
        waterButton.layer.borderWidth = 1
        waterButton.layer.borderColor = UIColor.fontAndBorderColor().cgColor
        waterButton.setTitle(" 물먹기", for: .normal)
        waterButton.titleLabel?.font = .systemFont(ofSize: 14)
        waterButton.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        waterButton.tintColor = .fontAndBorderColor()
        waterButton.setTitleColor(.fontAndBorderColor(), for: .normal)
    }
    
    
    func configureTalkingLabel() {
        talkingLabel.text = smallTalk.lines.randomElement()
        talkingLabel.layer.borderColor = UIColor.fontAndBorderColor().cgColor
        talkingLabel.font = .boldSystemFont(ofSize: 13)
        talkingLabel.textColor = .fontAndBorderColor()
        talkingLabel.textAlignment = .center
        talkingLabel.numberOfLines = 0
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "\(UserDefaults.standard.string(forKey: "Naming") ?? "대장님")의 다마고치"
        talkingLabel.text = smallTalk.lines.randomElement()
    }

    
    func calculateLevel() -> Int {
        let levels = (Float(UserDefaults.standard.integer(forKey: "Food")) / 5) + (Float(UserDefaults.standard.integer(forKey: "Water")) / 2)
        
        switch levels {
        case 0..<20:
            UserDefaults.standard.set(1, forKey: "Level")
            return UserDefaults.standard.integer(forKey: "Level")
        case 20..<30:
            UserDefaults.standard.set(2, forKey: "Level")
            return UserDefaults.standard.integer(forKey: "Level")
        case 30..<40:
            UserDefaults.standard.set(3, forKey: "Level")
            return UserDefaults.standard.integer(forKey: "Level")
        case 40..<50:
            UserDefaults.standard.set(4, forKey: "Level")
            return UserDefaults.standard.integer(forKey: "Level")
        case 50..<60:
            UserDefaults.standard.set(5, forKey: "Level")
            return UserDefaults.standard.integer(forKey: "Level")
        case 60..<70:
            UserDefaults.standard.set(6, forKey: "Level")
            return UserDefaults.standard.integer(forKey: "Level")
        case 70..<80:
            UserDefaults.standard.set(7, forKey: "Level")
            return UserDefaults.standard.integer(forKey: "Level")
        case 80..<90:
            UserDefaults.standard.set(8, forKey: "Level")
            return UserDefaults.standard.integer(forKey: "Level")
        case 90..<100:
            UserDefaults.standard.set(9, forKey: "Level")
            return UserDefaults.standard.integer(forKey: "Level")
        case 100...:
            UserDefaults.standard.set(10, forKey: "Level")
            return UserDefaults.standard.integer(forKey: "Level")
        default:
            return UserDefaults.standard.integer(forKey: "Level")
        }
    }
    
    
    func inputImages() {
        guard let savedMonster = UserDefaults.standard.object(forKey: "Character") as? Data else { return }
        let decoder = JSONDecoder()
        guard let loadedMonster = try? decoder.decode(Damagotchi.self, from: savedMonster) else { return }

        switch UserDefaults.standard.integer(forKey: "Level") {
        case 0:
            mainImageView.image = UIImage(named: "\(loadedMonster.characterClass)-\(loadedMonster.level[Int(UserDefaults.standard.float(forKey: "Level"))])")
        case 1...8:
            mainImageView.image = UIImage(named: "\(loadedMonster.characterClass)-\(loadedMonster.level[Int(UserDefaults.standard.float(forKey: "Level")) - 1])")
        case 9...10:
            mainImageView.image = UIImage(named: "\(loadedMonster.characterClass)-\(loadedMonster.level[Int(UserDefaults.standard.float(forKey: "Level")) - 2])")
        default: break
        }
    }
    

    func showAlert(alertText : String, alertMessage : String, buttonName: String) {
        
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: buttonName, style: .default) { action -> Void in
            UserDefaults.standard.removeObject(forKey: "Naming")
            UserDefaults.standard.removeObject(forKey: "Intro")
            UserDefaults.standard.removeObject(forKey: "Character")
            UserDefaults.standard.removeObject(forKey: "Level")
            UserDefaults.standard.removeObject(forKey: "Food")
            UserDefaults.standard.removeObject(forKey: "Water")
            
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: ChoiceCollectionViewController.identifier) as? ChoiceCollectionViewController else { return }
            let nav = UINavigationController(rootViewController: vc)
            
            sceneDelegate?.window?.rootViewController = nav
            sceneDelegate?.window?.makeKeyAndVisible()
        })
        
        self.present(alert, animated: true, completion: nil)
    }

    
    
    // MARK: - IBActions
    
    @IBAction func foodButtonTapped(_ sender: UIButton) {
        
            if foodTextField.text?.isEmpty ?? true {
                
                let currentValue = UserDefaults.standard.integer(forKey: "Food")
                let updateValue = currentValue + 1
                UserDefaults.standard.set(updateValue, forKey: "Food")
                talkingLabel.text = smallTalk.food.randomElement()
                foodTextField.text = ""
                
            } else if Int(foodTextField.text ?? "") != nil, Int(foodTextField.text ?? "") ?? 1 > 0, Int(foodTextField.text ?? "") ?? 1 < 100 {
                
                let currentValue = UserDefaults.standard.integer(forKey: "Food")
                let updateValue = currentValue + (Int(foodTextField.text ?? "") ?? 1)
                UserDefaults.standard.set(updateValue, forKey: "Food")
                talkingLabel.text = smallTalk.food.randomElement()
                foodTextField.text = ""
                
            } else {
                foodTextField.text = ""
                view.makeToast("한번에 너무 많은 양을 먹을 수 없어요!", duration: 0.5, position: .bottom)
                deathCountArr[0] += 1
                switch deathCountArr[0] {
                case 2: showAlert(alertText: "다마고치가 죽었습니다!", alertMessage: "밥을 한번에 너무 많이 줘서 다마고치가 죽었습니다. 다시 시작해주세요.", buttonName: "확인")
                default: break
                }
            }

        view.endEditing(true)
        configureStatus()
        inputImages()
    }
    
    
    @IBAction func waterButtonTapped(_ sender: UIButton) {
        
            if waterTextField.text?.isEmpty ?? true {
                
                let currentValue = UserDefaults.standard.integer(forKey: "Water")
                let updateValue = currentValue + 1
                UserDefaults.standard.set(updateValue, forKey: "Water")
                talkingLabel.text = smallTalk.water.randomElement()
                waterTextField.text = ""
                
            } else if Int(waterTextField.text ?? "") != nil, Int(waterTextField.text ?? "") ?? 1 > 0, Int(waterTextField.text ?? "") ?? 1 < 50 {
                
                let currentValue = UserDefaults.standard.integer(forKey: "Water")
                let updateValue = currentValue + (Int(waterTextField.text ?? "") ?? 1)
                UserDefaults.standard.set(updateValue, forKey: "Water")
                talkingLabel.text = smallTalk.water.randomElement()
                waterTextField.text = ""
                
            } else {
                deathCountArr[1] += 1
                waterTextField.text = ""
                view.makeToast("한번에 너무 많은 양을 먹을 수 없어요!", duration: 0.5, position: .bottom)
                switch deathCountArr[1] {
                case 2: showAlert(alertText: "다마고치가 죽었습니다!", alertMessage: "물을 한번에 너무 많이 줘서 다마고치가 죽었습니다. 다시 시작해주세요.", buttonName: "확인")
                default: break
                }
            }

        view.endEditing(true)
        configureStatus()
        inputImages()
    }
}
