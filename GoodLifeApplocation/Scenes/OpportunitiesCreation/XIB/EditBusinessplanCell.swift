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

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        OpendDataList.isHidden = true

    }
    
    
    func configureCell(){
        planNameTxt.text=""
        planProsTxt.text=""
        planConsTxt.text=""
        urlTxt.text=""
        progressTxt.text=""
    }
    
}
