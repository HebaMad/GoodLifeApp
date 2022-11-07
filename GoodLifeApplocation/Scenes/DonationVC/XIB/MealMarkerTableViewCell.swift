//
//  MealMarkerTableViewCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 25/07/2022.
//

import UIKit
import SDWebImage
class MealMarkerTableViewCell: UITableViewCell,NibLoadableView {
    //MARK: - Outlet

    @IBOutlet weak var avatarImage: UIImageViewDesignable!
    @IBOutlet weak var descriptionTxt: UILabel!
    @IBOutlet weak var titleTxt: UILabel!
    
    
    private var skeletonViews = [UIView]()

    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(item:Founder){
        avatarImage.sd_setImage(with: URL(string: item.icon ?? ""))
        descriptionTxt.text = item.details
        titleTxt.text = item.title
    }
    
}
extension MealMarkerTableViewCell{
public func startSkeleton() {
    self.playSkeleton(for: self.skeletonViews)
}

public func stopSkeleton() {
    self.stopSkeleton(for: self.skeletonViews)
}
}
