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
        print(viewModel.models?.html2Attributed?.string)
        print(viewModel.websites?.html2Attributed?.string)
        print(viewModel.plans?.html2Attributed?.string)

        titleTxt.text = viewModel.title?.html2Attributed?.string
        subTitleTxt.text = viewModel.sub_title?.html2Attributed?.string
        financialModelTxt.text = viewModel.models?.html2Attributed?.string
        businessPlanTxt.text = viewModel.plans?.html2Attributed?.string
        websiteTxt.text = viewModel.websites?.html2Attributed?.string
        matchesPercentageTxt.text = String(describing: viewModel.opportunity_match ?? "")+"%" + " " + "Match"
        review.text = String(describing: viewModel.reviews_count ?? 0)

        
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
