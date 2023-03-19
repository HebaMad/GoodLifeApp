//
//  CategoryCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 14/03/2023.
//

import UIKit
import SDWebImage
class CategoryCell: UICollectionViewCell,NibLoadableView {

    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configureCell(data:mainType){
        categoryTitle.text=data.name
        categoryImage.sd_setImage(with: URL(string: data.logo ?? ""))

    }

}
