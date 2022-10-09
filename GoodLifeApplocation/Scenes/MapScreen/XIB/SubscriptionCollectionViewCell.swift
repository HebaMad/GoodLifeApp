//
//  SubscriptionCollectionViewCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/07/2022.
//

import UIKit

class SubscriptionCollectionViewCell: UICollectionViewCell,NibLoadableView   {
    
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var nextBtn: UIButtonDesignable!
    @IBOutlet weak var subTitleTxt: UILabel!
    @IBOutlet weak var financialModelTxt: UILabel!
    @IBOutlet weak var businessPlanTxt: UILabel!
    @IBOutlet weak var websiteTxt: UILabel!
    @IBOutlet weak var matchesPercentageTxt: UILabel!
    @IBOutlet weak var review: UILabel!
    
    
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(viewModel:OppourtinityDetails){
        
        titleTxt.text = viewModel.title
        subTitleTxt.text = viewModel.sub_title
        financialModelTxt.text = viewModel.models
        businessPlanTxt.text = viewModel.plans
        websiteTxt.text = viewModel.websites
        matchesPercentageTxt.text = String(describing: viewModel.opportunity_match)
        review.text = String(describing: viewModel.reviews_count)

        
    }
    

}


extension SubscriptionCollectionViewCell{
    struct ViewModel{
        let title:String
        let subTitleTxt:String
        let financialModelTxt:String
        let businessPlanTxt:String
        let websiteTxt:String
        let matchesPercentageTxt:Int
        let review:Int

    }
}
