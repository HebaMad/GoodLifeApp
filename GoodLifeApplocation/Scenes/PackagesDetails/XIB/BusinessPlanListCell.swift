//
//  BusinessPlanListCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 02/07/2023.
//

import UIKit

class BusinessPlanListCell: UITableViewCell,NibLoadableView {

    @IBOutlet weak var businessplanTitle: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
