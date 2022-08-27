//
//  SpecificFilterCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 08/08/2022.
//

import UIKit

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
    
    func setupCell(icon:String){
        categoriesIcon.image = UIImage(named: icon)
        categoriesTitle.text = icon
    }
}
