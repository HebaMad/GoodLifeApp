//
//  PastGoalsCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 04/08/2022.
//

import UIKit

class PastGoalsCell: UITableViewCell, NibLoadableView{
    //MARK: - Outlet

    @IBOutlet weak var goalDetailsText: UILabel!
    @IBOutlet weak var goalTitle: UILabel!
    
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
