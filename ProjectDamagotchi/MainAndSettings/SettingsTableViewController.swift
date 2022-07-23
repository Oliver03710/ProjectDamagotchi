//
//  SettingsTableViewController.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/23.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    // MARK: - Properties
    
    static let identifier = "SettingsTableViewController"
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavi()
    }

    
    // MARK: - Helper Functions
    
    func configureUI() {
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
    }
    
    
    func configureNavi() {
        view.backgroundColor = .backgroundColor()
        navigationItem.title = "설정"
        self.navigationController?.navigationBar.tintColor = UIColor.fontAndBorderColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontAndBorderColor()]
    }
    
    
    func showAlert(alertText : String, alertMessage : String, buttonName: String, cancelButton: String) {
        
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: buttonName, style: .default) { action -> Void in
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: ChoiceCollectionViewController.identifier) as? ChoiceCollectionViewController else { return }
            let nav = UINavigationController(rootViewController: vc)
            
            sceneDelegate?.window?.rootViewController = nav
            sceneDelegate?.window?.makeKeyAndVisible()
        })
        
        alert.addAction(UIAlertAction(title: cancelButton, style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Table View Functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }
        
        cell.configureCells(indexPath: indexPath)
        cell.layoutMargins = UIEdgeInsets.zero
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        switch indexPath.row {
        case 0:
            guard let vc = sb.instantiateViewController(withIdentifier: NamingViewController.identifier) as? NamingViewController else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            guard let vc = sb.instantiateViewController(withIdentifier: ChoiceCollectionViewController.identifier) as? ChoiceCollectionViewController else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            showAlert(alertText: "데이터 초기화", alertMessage: "정말 다시 처음부터 시작?", buttonName: "예", cancelButton: "아니오")
        default: break
        }
        
    }
    
    
    
    
    
}
