//
//  TaskCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class TaskCell: UITableViewCell ,NibLoadableView {
    //MARK: - Outlet

    @IBOutlet weak var timeLimit: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var MarkBtn: UIButton!
    
    //MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - configuration cell

    func configureCell(iconSystem:UIImage,tint:UIColor,task:Tasks){
        MarkBtn.setBackgroundImage(iconSystem, for: .normal)
        MarkBtn.tintColor = tint
        titleLabel.text=task.title ?? ""
        
    }
    
}
