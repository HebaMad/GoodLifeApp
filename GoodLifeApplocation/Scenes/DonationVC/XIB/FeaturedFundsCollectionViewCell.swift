//
//  FeaturedFundsCollectionViewCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/07/2022.
//

import UIKit

class FeaturedFundsCollectionViewCell: UICollectionViewCell,ReusableView,NibLoadableView  {
    //MARK: - Outlet

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitleLbl: UILabel!
    
    //MARK: - Configuration cell

    func setup(_ item: ListItem) {
        cellImageView.image = UIImage(named: item.image)
        cellTitleLbl.text = item.title
    }
}
