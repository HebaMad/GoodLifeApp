//
//  menuItemCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 05/02/2023.
//

import UIKit

class MenuItemCell: UITableViewCell , NibLoadableView{

    @IBOutlet weak var dateIcon: UIImageView!
    @IBOutlet weak var noteTxt: UILabel!
    @IBOutlet weak var titleTxt: UILabel!
    
    @IBOutlet weak var editListItem: UIButtonDesignable!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCellOfMinistryIdea(object:MinistryIdea){
        dateIcon.isHidden=true
        titleTxt.text = object.title
        noteTxt.text = object.fund_type?.name
        
    }
    func configureCellOfvolunteerRequest(object:VolunteerRequests){
        titleTxt.text = object.title
        noteTxt.text=convertDateFormaterName(object.date ?? "")
        dateIcon.isHidden=false

    }
}
