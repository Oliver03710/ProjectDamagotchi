//
//  NamingViewController.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/23.
//

import UIKit

class NamingViewController: UIViewController {

    // MARK: - Properties
    
    static let identifier = "NamingViewController"
    
    @IBOutlet weak var namingTextField: UITextField!
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        configureUI()
    }
    
    
    // MARK: - Selectors
    
    @objc func saveName() {
        UserDefaults.standard.set(namingTextField.text, forKey: "Naming")
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    // MARK: - Helper Functions
    
    func configureUI() {
        namingTextField.borderStyle = .none
        namingTextField.text = UserDefaults.standard.string(forKey: "Naming") ?? "대장님"
        namingTextField.textColor = .fontAndBorderColor()
    }
    
    func configureNavi() {
        view.backgroundColor = .backgroundColor()
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .backgroundColor()
        navigationItem.scrollEdgeAppearance = barAppearance
        navigationItem.title = "\(UserDefaults.standard.string(forKey: "Naming") ?? "대장님") 이름 정하기"
        self.navigationController?.navigationBar.tintColor = UIColor.fontAndBorderColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontAndBorderColor()]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveName))

    }
    
    
    // MARK: - IBActions
    
    @IBAction func namingTextFieldFilled(_ sender: UITextField) {
        view.endEditing(true)
    }
}
