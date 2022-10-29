//
//  SpecificWebsiteCompetitorCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/10/2022.
//

import UIKit

class SpecificWebsiteCompetitorCell: UICollectionViewCell , NibLoadableView{
    //MARK: - Outlet
    
    @IBOutlet weak var websiteNameText: UILabel!
    @IBOutlet weak var modelNumber: UILabel!
    @IBOutlet weak var websiteInfo: UILabel!
    
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(index:Int,ViewModel:OppurtinityDetails){
        websiteInfo.text = ViewModel.details?.html2Attributed?.string
        modelNumber.text = "Model" + " " + "#\(index)"
        
    }
}
