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
    
    @IBOutlet weak var filteringTitle: UILabel!
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configureCell(category:MainCategories){
        categoriesFilterBtn.sd_setImage(with:URL(string: category.icon ?? ""), for: .normal)
        filteringTitle.text=category.name
        
    }

}
