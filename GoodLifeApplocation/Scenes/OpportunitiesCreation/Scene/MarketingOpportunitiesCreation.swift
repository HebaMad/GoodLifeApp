//
//  MarketingOpportunitiesCreation.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/03/2023.
//

import UIKit

class MarketingOpportunitiesCreation: UIViewController {
    @IBOutlet weak var marketName: UITextField!
    
    @IBOutlet weak var addMarket: UIButton!
    @IBOutlet weak var nextBtn: UIButtonDesignable!
    @IBOutlet weak var marketSize: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindButtons()
    }
    

}

extension MarketingOpportunitiesCreation {
    
    func bindButtons(){
        nextBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        addMarket.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
        case nextBtn:
            print("")
        case addMarket:
            print("")
        default:
            print("")

        }
    }
}
