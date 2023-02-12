//
//  HeaderCollectionReusableView.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/07/2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    //MARK: - Properties

    static let headerIdentifier = "titleCollectionview"
    
    //MARK: - Outlet

    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var headerTitleLabel: UILabel!
    
    @IBOutlet weak var editBtn: UIButton!
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - Configuration cell

    func setup(_ title: String) {
        headerTitleLabel.text = title
    }
    
}
