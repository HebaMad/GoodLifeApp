//
//  ResourceDetailsCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class ResourceDetailsCell: UITableViewCell ,ReusableView, NibLoadableView{
    //MARK: - Outlet

    @IBOutlet weak var showHideButton: UIButton!
    @IBOutlet weak var detailsLabel: UILabel!
    
    //MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        detailsLabel.isHidden = true
    }
    //MARK: - configuration cell

    
}
