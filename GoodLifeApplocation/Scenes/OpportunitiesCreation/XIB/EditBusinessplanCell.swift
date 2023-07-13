//
//  EditBusinessplanCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 05/07/2023.
//

import UIKit

class EditBusinessplanCell: UITableViewCell,NibLoadableView {

    @IBOutlet weak var OpendDataList: UIStackView!
    @IBOutlet weak var saveChangesBtn: UIButton!
    @IBOutlet weak var marketSizeProgress: UISlider!
    @IBOutlet weak var planNameTxt: UITextField!
    
    @IBOutlet weak var progressTxt: UILabel!
    @IBOutlet weak var urlTxt: BottomBorderTextField!
    @IBOutlet weak var planProsTxt: UITextView!
    
    @IBOutlet weak var planConsTxt: UITextView!
    @IBOutlet weak var showHideButton: UIButton!

    @IBOutlet weak var nameTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupBorder()

        
    }
    
    func setupBorder(){
        
        planProsTxt.layer.borderColor = UIColor(named: "bg5")?.cgColor
        planProsTxt.layer.borderWidth =  0.5
        planConsTxt.layer.borderColor = UIColor(named: "bg5")?.cgColor
        planConsTxt.layer.borderWidth =  0.5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        OpendDataList.isHidden = true

    }
    
    
    func configureCell(businessplanData:businessplanDetails){
        nameTxt.text = businessplanData.name ?? ""
        planNameTxt.text=businessplanData.name ?? ""
        planProsTxt.text=businessplanData.pros ?? ""
        planConsTxt.text=businessplanData.cons ?? ""
        urlTxt.text=businessplanData.url ?? ""
        progressTxt.text=String(describing: Int(Float(businessplanData.market_size ?? "") ?? 0.0) )
        marketSizeProgress.value=Float(businessplanData.market_size ?? "") ?? 0.0
    }
    
}
