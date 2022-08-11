//
//  ResourceCollectionViewCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class ResourceCollectionViewCell: UICollectionViewCell,ReusableView,NibLoadableView  {
    //MARK: - Outlet

    @IBOutlet weak var resourceIcon: UIImageView!
    @IBOutlet weak var categoriesTitle: UILabel!
    
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - configuration cell

    func setup(_ item: listData) {
        categoriesTitle.text = item.title
    }
}