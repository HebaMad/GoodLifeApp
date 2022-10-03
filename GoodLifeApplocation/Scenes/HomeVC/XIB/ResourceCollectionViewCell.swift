//
//  ResourceCollectionViewCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit
import SDWebImage
import SkeletonView
class ResourceCollectionViewCell: UICollectionViewCell,NibLoadableView  {
    //MARK: - Outlet

    @IBOutlet weak var resourceIcon: UIImageView!
    @IBOutlet weak var categoriesTitle: UILabel!
    
    //MARK: - Properties

    private var skeletonViews = [UIView]()

    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
//        self.skeletonViews = [
//            self.resourceIcon,
//            self.categoriesTitle,
//        ]
    }
    
    //MARK: - configuration cell

    func setup(_ item: Resources) {
        categoriesTitle.text = item.title
        resourceIcon.sd_setImage(with: URL(string:item.icon ?? "" ))
    }
}
extension ResourceCollectionViewCell {
    
    public func startSkeleton() {
        self.playSkeleton(for: self.skeletonViews)
    }
    
    public func stopSkeleton() {
        self.stopSkeleton(for: self.skeletonViews)
    }
}
