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
    @IBOutlet weak var financialModelTxt: UILabel!
  
    @IBOutlet weak var matchesPercentageTxt: UILabel!
    @IBOutlet weak var review: UILabel!
    
    
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configureCell(viewModel:opportunitiesData){

        titleTxt.text = viewModel.name
        financialModelTxt.text = viewModel.general?.financial_models?.html2Attributed?.string
        matchesPercentageTxt.text = "\((viewModel.match?.replacingOccurrences(of: "%", with: "") ?? ""))" + "%" + " " + "Match"
        review.text = String(describing: viewModel.rate_count ?? 0)

        
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
