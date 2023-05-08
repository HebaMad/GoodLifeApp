//
//  GeneralMarketingBreakdown.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 10/10/2022.
//

import UIKit

class GeneralMarketingBreakdown: UITableViewCell,NibLoadableView {

    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var Description: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(description:String){
                Description.text = description
        Description.textColor = .black
        
    }
    
    func configureMarketingCell(item:GeneralOppourtinityDetails){
        
        titleTxt.text = item.title ?? ""
        Description.text = item.details?.html2Attributed?.string

    }
    
}
