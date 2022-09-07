//
//  OtherFundsCollectionViewCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/07/2022.
//

import UIKit

class OtherFundsCollectionViewCell: UICollectionViewCell,NibLoadableView  {
    //MARK: - Outlet

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitleLbl: UILabel!
    
    //MARK: - Configuration cell

    func setup(_ item: Founder) {
        cellImageView.sd_setImage(with: URL(string: item.icon ?? ""))
        cellTitleLbl.text = item.title ?? ""
    }
}
