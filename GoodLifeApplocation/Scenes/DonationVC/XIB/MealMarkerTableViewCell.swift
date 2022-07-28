//
//  MealMarkerTableViewCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 25/07/2022.
//

import UIKit

class MealMarkerTableViewCell: UITableViewCell,ReusableView,NibLoadableView {

    @IBOutlet weak var avatarImage: UIImageViewDesignable!
    @IBOutlet weak var descriptionTxt: UILabel!
    @IBOutlet weak var titleTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
