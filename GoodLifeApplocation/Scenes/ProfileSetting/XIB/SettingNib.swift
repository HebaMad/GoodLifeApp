//
//  HelpCenterSettingNib.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/08/2022.
//

import UIKit

class SettingNib: UIViewFromNib {
    
    @IBOutlet  weak var titleTxt: UILabel!
    @IBOutlet weak var ViewBtn: UIButton!
    
    
    @IBInspectable var titletext:String?{
        didSet {
            titleTextEdit()
        }
    }
    
    func titleTextEdit(){
        titleTxt.text = titletext
    }
}
