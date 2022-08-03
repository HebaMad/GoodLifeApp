//
//  TaskCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class TaskCell: UITableViewCell ,ReusableView,NibLoadableView {

    @IBOutlet weak var timeLimit: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var MarkBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
