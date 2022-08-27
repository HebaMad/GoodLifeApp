//
//  ActivityCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 08/08/2022.
//

import UIKit

class ActivityCell: UICollectionViewCell,NibLoadableView {
    
    //MARK: - Outlet

    @IBOutlet weak var communityLabel: UILabel!
    
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - configuration

    func setup(_ item: listData) {
        communityLabel.text = item.title
    }
}
