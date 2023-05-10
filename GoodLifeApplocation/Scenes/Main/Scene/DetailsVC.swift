//
//  DetailsVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 10/05/2023.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var nameTxt: UILabel!
    
    @IBOutlet weak var descriptionTxt: UILabel!
    
    @IBOutlet weak var rateTxt: UILabel!
    
    @IBOutlet weak var matchPercent: UILabel!
    var onFilterDissmissed : OnFilterDissmissed?

    var opportunitiesDetails:opportunitiesDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        
    }

    func setupData(){
        
        titleTxt.text = opportunitiesDetails?.header?.title
        nameTxt.text = opportunitiesDetails?.header?.name
        rateTxt.text =  String(describing: opportunitiesDetails?.header?.rate ?? 0)
        matchPercent.text = opportunitiesDetails?.header?.match
        descriptionTxt.text = opportunitiesDetails?.header?.financial_models?.html2Attributed?.string

    }
    
    @IBAction func moreDetailsBtn(_ sender: Any) {
        
        self.dismiss(animated: true) {
            if let _delegate = self.onFilterDissmissed{
                _delegate.filteredData(data:self.opportunitiesDetails!)
            }}
    }
    

}


