//
//  ResourceCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 04/08/2022.
//

import UIKit

class ResourceCell: UITableViewCell, NibLoadableView {
    //MARK: - Outlet

    @IBOutlet weak var resourceTitleText: UILabel!
    @IBOutlet weak var resourceDetails: UILabel!
    
    
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
    func configureResourceCell(resource:Resources){
        resourceTitleText.text = resource.title ?? ""
        resourceDetails.text = resource.details ?? ""

    }
    
    func configureCategoriesCell(category:Categories){
        resourceTitleText.text = category.title ?? ""
        resourceDetails.text = category.details ?? ""
    }
    
}
