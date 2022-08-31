//
//  VenturesCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/08/2022.
//

import UIKit

class VenturesCell: UITableViewCell,NibLoadableView {
    
     //MARK: - Outlet
    
    @IBOutlet weak var ventureTitle: UILabel!
    
    //MARK: - init

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
