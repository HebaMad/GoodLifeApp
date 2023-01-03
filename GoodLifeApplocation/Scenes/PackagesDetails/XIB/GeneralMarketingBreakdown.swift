//
//  GeneralMarketingBreakdown.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 10/10/2022.
//

import UIKit

class GeneralMarketingBreakdown: UITableViewCell,NibLoadableView {

    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var urlTxt: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var approachStackview: UIStackView!
    @IBOutlet weak var approachValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(item:GeneralOppourtinityDetails,id:Int){
        
        titleTxt.text = item.title ?? ""
        Description.text = item.details ?? ""
        urlTxt.text=item.url ?? ""
        
    }
    
    func configureMarketingCell(item:GeneralOppourtinityDetails){
        
        titleTxt.text = item.title ?? ""
        Description.text = item.details?.html2Attributed?.string
        urlTxt.text=item.url ?? ""
        approachValue.text = item.approach ?? ""
    }
    
}
