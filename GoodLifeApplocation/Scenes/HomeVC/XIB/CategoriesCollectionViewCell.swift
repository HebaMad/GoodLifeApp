//
//  CategoriesCollectionViewCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit
import SkeletonView
class CategoriesCollectionViewCell: UICollectionViewCell,NibLoadableView  {
    
//MARK: - Outlet
    
    @IBOutlet weak var CategoryTitle: UILabel!
    @IBOutlet weak var noOfCategory: UILabel!
    @IBOutlet weak var percentageOfAccomplish: UILabel!
    
    //MARK: - Properties

    private var skeletonViews = [UIView]()

    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
//        self.skeletonViews = [
//            self.CategoryTitle,
////            self.noOfCategory,
////            self.percentageOfAccomplish,
//
//        ]
    }
    
    
    //MARK: - configuration cell

    func setup(_ item: Categories) {
        CategoryTitle.text = item.title
    }
}
extension CategoriesCollectionViewCell {
    
    public func startSkeleton() {
        self.playSkeleton(for: self.skeletonViews)
    }
    
    public func stopSkeleton() {
        self.stopSkeleton(for: self.skeletonViews)
    }
}
