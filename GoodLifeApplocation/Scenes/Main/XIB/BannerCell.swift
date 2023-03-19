//
//  BannerCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 14/03/2023.
//

import UIKit

class BannerCell: UICollectionViewCell,NibLoadableView {

    
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var shortDescriptionTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    
    func configureCell(data:sliderData){
        titleTxt.text=data.title
        shortDescriptionTxt.text=data.description
        bannerImage.sd_setImage(with: URL(string: data.image ?? ""))

    }
}
