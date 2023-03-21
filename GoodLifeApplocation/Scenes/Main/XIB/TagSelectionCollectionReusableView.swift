//
//  TagSelectionCollectionReusableView.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 20/03/2023.
//

import UIKit

class TagSelectionCollectionReusableView: UICollectionReusableView {
    static let HeaderIdentifier = "TagSelectionCollectionReusableView"

    
    @IBOutlet weak var tagSelectionTitle: UITextField!
    @IBOutlet weak var addBtn: UIButtonDesignable!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
