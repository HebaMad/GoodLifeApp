//
//  TaskCollectionViewCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell,ReusableView,NibLoadableView  {

    //MARK: - Outlet
    
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var subTitleText: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var startBtn: UIButtonDesignable!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(_ item: listData) {
        titleTxt.text = item.title
    }
}
