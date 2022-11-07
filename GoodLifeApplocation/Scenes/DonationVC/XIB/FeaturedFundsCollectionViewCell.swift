//
//  FeaturedFundsCollectionViewCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/07/2022.
//

import UIKit
import SDWebImage
class FeaturedFundsCollectionViewCell: UICollectionViewCell,NibLoadableView{
    //MARK: - Outlet

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitleLbl: UILabel!
    @IBOutlet weak var detailsTxt: UILabel!
    
    //MARK: - Properties

    private var skeletonViews = [UIView]()

    override func awakeFromNib() {
        super.awakeFromNib()
                self.skeletonViews = [
                    self.cellImageView,
                    self.cellTitleLbl,
                    self.detailsTxt,
        
                ]
        self.backgroundColor = .clear
     
    }
    //MARK: - Configuration cell

    func setup(_ item: Founder) {
        cellImageView.sd_setImage(with: URL(string: item.icon ?? ""))
        cellTitleLbl.text = item.title ?? ""
        detailsTxt.text = item.details ?? ""
    }
    
    
}
extension FeaturedFundsCollectionViewCell {
    
    public func startSkeleton() {
        self.playSkeleton(for: self.skeletonViews)
    }
    
    public func stopSkeleton() {
        self.stopSkeleton(for: self.skeletonViews)
    }
}
