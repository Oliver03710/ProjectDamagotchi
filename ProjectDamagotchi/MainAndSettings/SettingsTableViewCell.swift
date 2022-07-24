//
//  SettingsTableViewCell.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/07/23.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    static let identifier = "SettingsTableViewCell"
    
    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    let arr = ["pencil", "moon.fill", "arrow.clockwise"]
    let title = ["내 이름 설정하기", "다마고치 변경하기", "데이터 초기화"]
    var detail = ["\(UserDefaults.standard.string(forKey: "Naming") ?? "대장님")", "", ""]
    
    // MARK: - Helper Functions
    
    func configureCells(indexPath: IndexPath) {
        
        settingImageView.image = UIImage(systemName: arr[indexPath.row])
        settingImageView.tintColor = .fontAndBorderColor()
        
        titleLabel.text = title[indexPath.row]
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 13)
        
        detailLabel.text = detail[indexPath.row]
        detailLabel.textColor = .fontAndBorderColor()
        detailLabel.font = .systemFont(ofSize: 13)
    }
}
