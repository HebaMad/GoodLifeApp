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

    }

    
    func setupCell(items:OppurtinityDetails){
        titleTxt.text = items.title?.html2Attributed?.string
        informationTxt.text = items.details?.html2Attributed?.string

    }
}
