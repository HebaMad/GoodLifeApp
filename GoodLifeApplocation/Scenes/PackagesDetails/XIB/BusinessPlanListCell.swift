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
    
//    @IBOutlet weak var cellView: UIViewDesignable!
    override func awakeFromNib() {
        super.awakeFromNib()
//        cellView.layer.borderWidth=4
//        cellView.layer.borderColor = UIColor.darkGray.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
