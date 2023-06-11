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
        if data.completion == 100 {
            print("ttttttttttt")
            completeInformationBtn.setTitleColor(.darkGray, for: .normal)
            completeInformationBtn.setTitle("Application Completed Successfully", for: .normal)

            completeInformationBtn.isEnabled=false
        }else{
            completeInformationBtn.setTitleColor( UIColor(named: "button") ?? .clear, for: .normal)
            completeInformationBtn.isEnabled=true
        }
        if  data.status == "pending" {

            status.bgColor = UIColor(named: "unselectedTab") ?? .clear
            completeInformationBtn.setTitle("please wait until your request is accepted", for: .normal)
            completeInformationBtn.isEnabled=false


        }else{
            status.bgColor = UIColor(named: "ButtonColor") ?? .clear
            completeInformationBtn.setTitle("Complete information", for: .normal)

        }
        completeProgressView.progress=Float(data.completion ?? 0)/100.0

        status.text = "  " + (data.status ?? "")

        
    }
    
}
