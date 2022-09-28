//
//  LessonDetailsCollectionCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/09/2022.
//

import UIKit

class LessonDetailsCollectionCell: UICollectionViewCell,NibLoadableView {

    @IBOutlet weak var detailsTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(title:String){
        detailsTxt.text = title
    }

}
