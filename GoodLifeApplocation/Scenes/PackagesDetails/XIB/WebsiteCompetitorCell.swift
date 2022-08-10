//
//  WebsiteCompetitorCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 10/08/2022.
//

import UIKit

class WebsiteCompetitorCell: UITableViewCell, ReusableView, NibLoadableView {
    
    //MARK: - Outlet
    
    @IBOutlet weak var websiteNameText: UILabel!
    @IBOutlet weak var modelNumber: UILabel!
    @IBOutlet weak var websiteInfo: UILabel!
    
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
