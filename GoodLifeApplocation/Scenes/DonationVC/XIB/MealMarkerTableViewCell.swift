//
//  MealMarkerTableViewCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 25/07/2022.
//

import UIKit
import SDWebImage
class MealMarkerTableViewCell: UITableViewCell,NibLoadableView {
    //MARK: - Outlet

    @IBOutlet weak var avatarImage: UIImageViewDesignable!
    @IBOutlet weak var descriptionTxt: UILabel!
    @IBOutlet weak var titleTxt: UILabel!
    
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(item:Founder){
        avatarImage.sd_setImage(with: URL(string: item.icon ?? ""))
        descriptionTxt.text = item.details
        titleTxt.text = item.title
    }
    
}
