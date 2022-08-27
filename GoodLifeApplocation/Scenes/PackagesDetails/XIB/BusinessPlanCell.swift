//
//  BusinessPlanCELL.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 12/08/2022.
//

import UIKit

class BusinessPlanCell: UICollectionViewCell, NibLoadableView {

    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var informationTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setupCell(items:BusinessPlanData){
        titleTxt.text = items.title
        informationTxt.text = items.information

    }
}
