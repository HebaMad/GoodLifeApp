//
//  CategoriesCollectionViewCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell,ReusableView,NibLoadableView  {
    
//MARK: - Outlet
    
    @IBOutlet weak var CategoryTitle: UILabel!
    @IBOutlet weak var noOfCategory: UILabel!
    @IBOutlet weak var percentageOfAccomplish: UILabel!
    
    //MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - configuration cell

    func setup(_ item: listData) {
        CategoryTitle.text = item.title
    }
}
