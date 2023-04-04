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
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var status: UILabelDesignable!

    @IBOutlet weak var completeInformationBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    func configureCell(data:opportunitiesData){
        titleTxt.text = data.title
        dateTxt.text=data.created_at
        completeProgressView.progress=Float(data.completion ?? 0)
        if  data.status == "pending" {

            status.bgColor = UIColor(named: "unselectedTab") ?? .clear

        }else{
            status.bgColor = UIColor(named: "ButtonColor") ?? .clear
        }
        status.text = "  " + (data.status ?? "")

        
    }
    
}
