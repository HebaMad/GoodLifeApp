//
//  GoalAndBenchmarkCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class GoalAndBenchmarkCell: UITableViewCell,ReusableView,NibLoadableView  {
    //MARK: - Outlet
    @IBOutlet weak var goalTitle: UILabel!
    @IBOutlet weak var goalDescription: UILabel!
    @IBOutlet weak var noOfDate: UILabel!
    
    
    
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

    
}
