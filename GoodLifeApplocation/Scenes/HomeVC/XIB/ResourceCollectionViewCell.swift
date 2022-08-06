//
//  ResourceCollectionViewCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class ResourceCollectionViewCell: UICollectionViewCell,ReusableView,NibLoadableView  {

    @IBOutlet weak var categoriesTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(_ item: listData) {
        categoriesTitle.text = item.title
    }
}
