//
//  GeneralLiturgicalCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 04/01/2023.
//

import UIKit

class GeneralLiturgicalCell: UICollectionViewCell , NibLoadableView{

    
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var urlTxt: UILabel!
    @IBOutlet weak var Description: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(item:OppurtinityDetails){
        
        titleTxt.text = item.title ?? ""
        Description.text = item.details ?? ""
        urlTxt.text=item.url ?? ""
    }
}
