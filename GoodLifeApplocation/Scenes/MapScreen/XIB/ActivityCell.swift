//
//  ActivityCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 08/08/2022.
//

import UIKit
import SkeletonView
class ActivityCell: UICollectionViewCell,NibLoadableView {
    
    //MARK: - Outlet

    @IBOutlet weak var communityLabel: UILabel!
    
    //MARK: - Properties

    private var skeletonViews = [UIView]()

    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.skeletonViews = [
            self.communityLabel,
        ]
    }
    
    //MARK: - configuration

    func setup(_ item: mainType) {
        communityLabel.text = item.name
    }
}


extension ActivityCell {
    
    public func startSkeleton() {
        self.playSkeleton(for: self.skeletonViews)
    }
    
    public func stopSkeleton() {
        self.stopSkeleton(for: self.skeletonViews)
    }
}
