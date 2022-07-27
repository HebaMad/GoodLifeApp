//  MainTF.swift
//  Rakwa
//  Created by macbook on 9/9/21.

import UIKit
 class OpportunityView:UIViewFromNib{
     
    // MARK: - Outlet
     
    @IBOutlet  weak var titleTxt: UILabel!
     @IBOutlet weak var subTitleText: UILabel!
     @IBOutlet  weak var img: UIImageView!
    
     //MARK: - Properties
     
    @IBInspectable var image: UIImage? {
         didSet {
             updateView()
         }
     }
    
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

     
    func updateView() {
         img.image = self.image
             
         
     }
    func titleTextEdit() {
        titleTxt.text = self.text
             
         
     }
     
     func subTitleTextEdit() {
         subTitleText.text = self.subTitle
              
          
      }
}
