//
//  TimeCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 11/02/2023.
//

import UIKit

class TimeCell: UICollectionViewCell , NibLoadableView {

    @IBOutlet weak var titleLimit: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(data:listData){
        titleLimit.text = data.title
    }

}