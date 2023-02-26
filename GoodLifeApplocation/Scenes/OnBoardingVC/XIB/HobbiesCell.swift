//
//  HobbiesCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 10/02/2023.
//

import UIKit

class HobbiesCell: UICollectionViewCell , NibLoadableView {

    //MARK: - Outlet

    @IBOutlet weak var hobbyView: UIViewDesignable!
    @IBOutlet weak var hobbiesTitle: UILabel!
    
    @IBOutlet weak var deleteItemBtn: UIButton!
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //MARK: - setup Cell Data

    func setupCell(hobbyTitle:listData){
        self.hobbiesTitle.text = hobbyTitle.title
    }
    
    func setupCustomCell(hobbyTitle:String){
        self.hobbiesTitle.text = hobbyTitle
    }
}
