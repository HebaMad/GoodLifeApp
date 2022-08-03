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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
