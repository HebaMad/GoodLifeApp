//
//  AllCategoriesCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 04/08/2022.
//

import UIKit

class AllCategoriesCell: UITableViewCell, NibLoadableView {
    //MARK: - Outlet

    @IBOutlet weak var categoryTitleText: UILabel!
    @IBOutlet weak var noOfGoal: UILabel!
    @IBOutlet weak var goalProgressview: UIProgressView!
    @IBOutlet weak var progressPercent: UILabel!
    
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - configuration cell

    
}
