//  MainTF.swift
//  Rakwa
//  Created by macbook on 9/9/21.

import UIKit
 class OpportunityView:UIViewFromNib{
     
    // MARK: - Outlet
     
    @IBOutlet  weak var titleTxt: UILabel!
     @IBOutlet weak var subTitleText: UILabel!
     @IBOutlet weak var ViewBtn: UIButton!
     
     //MARK: - Properties
     

    @IBInspectable var text:String?{
        didSet {
            titleTextEdit()
      }
    }
     @IBInspectable var subTitle:String?{
         didSet {
             subTitleTextEdit()
       }
     }
     
     //MARK: - private Handler

     

    func titleTextEdit() {
        titleTxt.text = self.text
         
     }
     
     func subTitleTextEdit() {
         subTitleText.text = self.subTitle
          
      }
}
