//
//  MainViewController.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/23.
//

import UIKit

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
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setNavi()
        configureNavi()
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
        navigationItem.title = "대장님의 다마고치"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(showSettings))
    }
    
    func configureUI() {
        mainImageView.image = UIImage(named: "noImage")
    }

    @IBAction func unwindTransitionToMain(Segue: UIStoryboardSegue) {
        
    }
}
