//
//  TaskCollectionViewCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit
import SkeletonView
class TaskCollectionViewCell: UICollectionViewCell,NibLoadableView  {

    //MARK: - Outlet
    
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var subTitleText: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var DoneBtn: UIButtonDesignable!

    //MARK: - Properties

    private var skeletonViews = [UIView]()

    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
//        self.skeletonViews = [
//            self.titleTxt,
//            self.subTitleText,
//            self.time,
//            self.DoneBtn,
//
//        ]
    }
    
    
    //MARK: - configuration cell

    func setup(_ item: Tasks) {
        titleTxt.text = item.title
        subTitleText.text = item.category?.title ?? ""
        time.text = convertDateFormater(item.start_date ?? "") + " - " + convertDateFormater(item.end_date ?? "")
    }
}
extension TaskCollectionViewCell {
    
    public func startSkeleton() {
        self.playSkeleton(for: self.skeletonViews)
    }
    
    public func stopSkeleton() {
        self.stopSkeleton(for: self.skeletonViews)
    }
}
