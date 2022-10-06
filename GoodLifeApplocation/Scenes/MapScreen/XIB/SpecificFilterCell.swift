//
//  SpecificFilterCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 08/08/2022.
//

import UIKit
import SDWebImage
class SpecificFilterCell: UICollectionViewCell,NibLoadableView   {
    
    //MARK: - outlet
    
    @IBOutlet weak var categoriesIcon: UIImageView!
    @IBOutlet weak var categoriesTitle: UILabel!
    
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    //MARK: - Configuration
    
    func setupCell(icon:String,title:String){
        categoriesIcon.sd_setImage(with: URL(string: icon))
        categoriesTitle.text = title
    }
}

