//
//  ActivityCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 08/08/2022.
//

import UIKit

class ActivityCell: UICollectionViewCell,ReusableView,NibLoadableView {
    @IBOutlet weak var communityLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(_ item: listData) {
        communityLabel.text = item.title
    }
}
