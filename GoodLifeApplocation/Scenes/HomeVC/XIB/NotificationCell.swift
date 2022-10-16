//
//  NotificationCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 16/10/2022.
//

import UIKit

class NotificationCell: UITableViewCell , NibLoadableView{
    
    //MARK: - Outlet
    
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var detailsTxt: UILabel!
    
    
    //MARK: - init

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - Configure Cell

   func configureCell(title:String,details:String){
        
       self.titleTxt.text = title
       self.detailsTxt.text = details
   
   }
    
    
}
