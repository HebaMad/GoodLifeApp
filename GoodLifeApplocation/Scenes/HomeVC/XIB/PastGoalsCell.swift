//
//  PastGoalsCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 04/08/2022.
//

import UIKit

class PastGoalsCell: UITableViewCell, NibLoadableView{
    //MARK: - Outlet

    @IBOutlet weak var goalTitle: UILabel!
    @IBOutlet weak var MarkBtn: UIButton!

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
    func configureCell(Goal:Goals,iconSystem:UIImage,tint:UIColor){
        MarkBtn.setBackgroundImage(iconSystem, for: .normal)
        MarkBtn.tintColor = tint
        goalTitle.text = Goal.title ?? ""
    }
    
}
