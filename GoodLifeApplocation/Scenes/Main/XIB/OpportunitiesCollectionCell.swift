//
//  OpportunitiesCollectionCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 14/03/2023.
//

import UIKit

class OpportunitiesCollectionCell: UICollectionViewCell,NibLoadableView {

    @IBOutlet weak var opportunitiesProgressview: UIProgressView!
    @IBOutlet weak var dateOfTitle: UILabel!
    @IBOutlet weak var opportunitiesTitle: UILabel!
    @IBOutlet weak var status: UILabelDesignable!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configureCell(data:opportunitiesData){
        opportunitiesTitle.text=data.title
        opportunitiesProgressview.progress=Float(data.completion ?? 0)/100.0

        print(data.created_at ?? "")
        dateOfTitle.text=data.created_at
        status.text = "  " + (data.status ?? "")
        if  data.status == "pending" {
            status.bgColor = UIColor(named: "unselectedTab") ?? .clear
        }else{
            status.bgColor = UIColor(named: "ButtonColor") ?? .clear

        }
    }
}
