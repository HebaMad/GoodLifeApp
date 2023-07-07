//
//  GraphMarketSizeCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 07/07/2023.
//

import UIKit

class GraphMarketSizeCell: UITableViewCell,NibLoadableView {

    @IBOutlet weak var valueTxt: UILabel!
    @IBOutlet weak var marketTxt: UILabel!
    
    @IBOutlet weak var deleteBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    func configureCell(MarketName:String,MarketSize:String){
        
        marketTxt.text=MarketName
        valueTxt.text = MarketSize + "%"
        
    }
    
    
}
