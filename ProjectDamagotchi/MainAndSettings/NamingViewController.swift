//
//  NamingViewController.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/23.
//

import UIKit

class NamingViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var namingTextField: UITextField!
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        configureUI()
    }
    
    
    // MARK: - Selectors
    
    @objc func saveName() {
        
        guard let text = namingTextField.text else { return }
        UserdefaultsHelper.standard.name = text
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    // MARK: - Helper Functions
    
    func configureUI() {
        namingTextField.borderStyle = .none
        namingTextField.text = UserdefaultsHelper.standard.name
        namingTextField.textColor = .fontAndBorderColor()
    }
    
    func configureNavi() {
        view.backgroundColor = .backgroundColor()
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .backgroundColor()
        navigationItem.scrollEdgeAppearance = barAppearance
        
        navigationItem.title = "\(UserdefaultsHelper.standard.name) 이름 정하기"
        self.navigationController?.navigationBar.tintColor = UIColor.fontAndBorderColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontAndBorderColor()]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveName))

    }
    
    
    // MARK: - IBActions
    
    @IBAction func namingTextFieldFilled(_ sender: UITextField) {
        view.endEditing(true)
    }
}
