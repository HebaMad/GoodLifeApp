//
//  FilterCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 08/08/2022.
//

import UIKit
import SDWebImage
class FilterCell: UICollectionViewCell,NibLoadableView   {
    
    //MARK: - Outlet
    
    @IBOutlet weak var categoriesFilterBtn: UIButtonDesignable!
    
    
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configureCell(category:MainCategories){
        categoriesFilterBtn.sd_setImage(with:URL(string: category.icon ?? ""), for: .normal)
        
    }

}
