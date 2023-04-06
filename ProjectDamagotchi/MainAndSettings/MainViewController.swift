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

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var foodTextField: UITextField!
    @IBOutlet weak var foodButton: UIButton!
    
    @IBOutlet weak var waterTextField: UITextField!
    @IBOutlet weak var waterButton: UIButton!
    
    @IBOutlet weak var talkingLabel: UILabel!
    
    var deathCountArr = [0, 0]  // [food, water]
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationItem.title = "\(UserdefaultsHelper.standard.name)의 다마고치"
        talkingLabel.text = Lines.general.smallTalks.randomElement()
        inputImages()
    }
    
    
    // MARK: - Selectors
    
    @objc func showSettings() {
        
        let sb = UIStoryboard(name: StoryboardName.main.rawValue, bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: SettingsTableViewController.identifier) as? SettingsTableViewController else { return }
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    // MARK: - Helper Functions
    
    func configureUI() {
        configureNavi()
        configureStatus()
        configureNameLabel()
        configureTextField()
        configureButtons()
        configureTalkingLabel()
        inputImages()
    }
    
    
    func configureNavi() {
        view.backgroundColor = .backgroundColor()
        self.navigationController?.navigationBar.tintColor = UIColor.fontAndBorderColor()
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .backgroundColor()
        navigationItem.scrollEdgeAppearance = barAppearance
        
        navigationItem.title = "\(UserdefaultsHelper.standard.name)의 다마고치"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(showSettings))
    }
    
    
    func configureStatus() {
        
        statusLabel.text =
        "LV\(refineData().leveling()) ・ 밥알 \(UserdefaultsHelper.standard.food)개 ・ 물방울 \(UserdefaultsHelper.standard.water)개"
        
        statusLabel.font = .boldSystemFont(ofSize: 15)
        statusLabel.textColor = .fontAndBorderColor()
    }
    
    
    func configureNameLabel() {
        nameLabel.setLabels(name: refineData().name, fontSize: 15)
    }
    
    
    func configureTextField() {
        foodTextField.setTextFields(placeholder: TextFields.food.rawValue)
        waterTextField.setTextFields(placeholder: TextFields.water.rawValue)
    }
    
    
    func configureButtons() {
        foodButton.setMainButtons(title: Buttons.food.rawValue, image: Images.food.rawValue)
        waterButton.setMainButtons(title: Buttons.water.rawValue, image: Images.water.rawValue)
    }
    
    
    func configureTalkingLabel() {
        talkingLabel.text = Lines.general.smallTalks.randomElement()
        talkingLabel.setLabels(fontSize: 13)
    }
    
    
    func inputImages() {
        mainImageView.image = UIImage(named: refineData().inputImages(character: refineData().characterClass))
    }
    
    
    func refineData() -> Damagotchi {
        guard let savedDamagotchi = UserdefaultsHelper.standard.character as? Data else { return Damagotchi(name: "", characterClass: 0)}
        let decoder = JSONDecoder()
        guard let loadedDamagotchi = try? decoder.decode(Damagotchi.self, from: savedDamagotchi) else { return Damagotchi(name: "", characterClass: 0) }
        return loadedDamagotchi
    }
    

    // MARK: - IBActions
    
    @IBAction func foodButtonTapped(_ sender: UIButton) {
        
        guard let foodText = foodTextField.text, let waterText = waterTextField.text else { return }
        guard let intFood = Int(foodText), let intWater = Int(waterText) else { return }
        
        if sender == foodButton {
            
            if foodText.isEmpty {
                UserdefaultsHelper.standard.food += 1
                talkingLabel.text = Lines.food.smallTalks.randomElement()
                foodTextField.text = ""
                
            } else if (intFood != 0), intFood > 0, intFood < 100 {
                
                UserdefaultsHelper.standard.food += intFood
                talkingLabel.text = Lines.food.smallTalks.randomElement()
                foodTextField.text = ""
                
            } else if intFood >= 100 {
                
                foodTextField.text = ""
                view.makeToast("한번에 너무 많은 양을 먹을 수 없어요!", duration: 0.5, position: .bottom)
                deathCountArr[0] += 1
                
                switch deathCountArr[0] {
                case 2: showAlert(alertText: "앗!", alertMessage: "밥을 한번에 너무 많이 줘서 다마고치가 죽었습니다. 다시 시작해주세요.", buttonName: "확인")
                default: break
                }
                
            } else {
                view.makeToast("이미 먹은 밥을 뺏지 마세요!", duration: 0.5, position: .bottom)
            }
            
            

        } else {
            
            if waterText.isEmpty {
                UserdefaultsHelper.standard.water += 1
                talkingLabel.text = Lines.water.smallTalks.randomElement()
                waterTextField.text = ""
                
            } else if (intWater != 0), intWater > 0, intWater < 100 {
                
                UserdefaultsHelper.standard.water += intWater
                talkingLabel.text = Lines.water.smallTalks.randomElement()
                waterTextField.text = ""
                
            } else if intWater >= 100 {
                
                waterTextField.text = ""
                view.makeToast("한번에 너무 많은 양을 먹을 수 없어요!", duration: 0.5, position: .bottom)
                deathCountArr[1] += 1
                
                switch deathCountArr[0] {
                case 2: showAlert(alertText: "앗!", alertMessage: "물을 한번에 너무 많이 줘서 다마고치가 죽었습니다. 다시 시작해주세요.", buttonName: "확인")
                default: break
                }
                
            } else {
                view.makeToast("이미 먹은 물을 뺏지 마세요!", duration: 0.5, position: .bottom)
            }

        }
        
        view.endEditing(true)
        configureStatus()
        inputImages()
        
    }
    
}

