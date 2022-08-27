//
//  FilterHeaderReusableview.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 08/08/2022.
//

import UIKit

class FilterHeaderReusableview: UICollectionReusableView,NibLoadableView {
    
    //MARK: - Outlet

    @IBOutlet weak var headerTitleLabel: UILabel!
    
    //MARK: - Properties

    static let headerIdentifier = "titleCollectionview"
    
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - configuration

    func setup(_ title: String) {
        headerTitleLabel.text = title
    }
}
