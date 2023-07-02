//
//  websiteCompetitor.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 05/04/2023.
//

import UIKit

class websiteCompetitor: UITableViewCell,NibLoadableView {

    @IBOutlet weak var urlTxt: UILabel!
    
    @IBOutlet weak var deleteBtn: UIButtonDesignable!
    @IBOutlet weak var copyLink: UIButtonDesignable!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(url:String){
        urlTxt.text = url
    }
    
}
