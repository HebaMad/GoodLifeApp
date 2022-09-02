//
//  TaskCollectionViewCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell,NibLoadableView  {

    //MARK: - Outlet
    
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var subTitleText: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var DoneBtn: UIButtonDesignable!
    
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - configuration cell

    func setup(_ item: Tasks) {
        titleTxt.text = item.title
        subTitleText.text = item.category?.title ?? ""
        time.text = convertDateFormater(item.start_date ?? "") + " - " + convertDateFormater(item.end_date ?? "")
    }
}
