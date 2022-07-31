//
//  HeaderCollectionReusableView.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/07/2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static let headerIdentifier = "titleCollectionview"
    

    @IBOutlet weak var headerTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(_ title: String) {
        headerTitleLabel.text = title
    }
    
}
