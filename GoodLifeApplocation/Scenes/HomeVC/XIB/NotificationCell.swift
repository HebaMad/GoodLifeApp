//
//  NotificationCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 16/10/2022.
//

import UIKit

class NotificationCell: UITableViewCell , NibLoadableView{
    
    //MARK: - Outlet
    
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var detailsTxt: UILabel!
    @IBOutlet weak var notificationTimeTxt: UILabel!
    
    //MARK: - Properties

    private var skeletonViews = [UIView]()

    
    //MARK: - init

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - Configure Cell

    func configureCell(data:notificationsDetails){
        
        self.titleTxt.text = data.title ?? ""
        self.detailsTxt.text = data.message ?? ""
        notificationTimeTxt.text = data.noti_since ?? ""
   }
    
    
}
extension NotificationCell {
    
    public func startSkeleton() {
        self.playSkeleton(for: self.skeletonViews)
    }
    
    public func stopSkeleton() {
        self.stopSkeleton(for: self.skeletonViews)
    }
}
