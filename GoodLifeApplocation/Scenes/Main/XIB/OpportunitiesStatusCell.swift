//
//  OpportunitiesStatusCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 11/03/2023.
//

import UIKit

class OpportunitiesStatusCell: UITableViewCell,NibLoadableView {

    @IBOutlet weak var completeProgressView: UIProgressView!
    @IBOutlet weak var dateTxt: UILabel!
    @IBOutlet weak var statusBtn: UIButtonDesignable!
    @IBOutlet weak var titleTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(data:opportunitiesData){
        titleTxt.text = data.title
        statusBtn.setTitle(data.status, for: .normal)
        dateTxt.text=convertDateFormaterFullString(data.created_at ?? "")

        
    }
    
}
