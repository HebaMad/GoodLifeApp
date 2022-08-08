//
//  FilterHeaderReusableview.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 08/08/2022.
//

import UIKit

class FilterHeaderReusableview: UICollectionReusableView,ReusableView,NibLoadableView {
    @IBOutlet weak var headerTitleLabel: UILabel!
    static let headerIdentifier = "titleCollectionview"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(_ title: String) {
        headerTitleLabel.text = title
    }
}
