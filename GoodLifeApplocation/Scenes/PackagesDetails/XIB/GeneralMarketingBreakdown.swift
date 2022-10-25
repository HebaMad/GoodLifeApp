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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(item:GeneralOppourtinityDetails){
        
        titleTxt.text = item.title ?? ""
        Description.text = item.details?.html2Attributed?.string
        urlTxt.text=item.url ?? ""
        
    }
    
}
