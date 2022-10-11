//
//  GeneralFinancialCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 10/10/2022.
//

import UIKit

class GeneralFinancialCell: UITableViewCell {
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var investmentAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
