//
//  BusinessPlanOpportunitiesCreation.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/03/2023.
//

import UIKit

class BusinessPlanOpportunitiesCreation: UIViewController {

    @IBOutlet weak var planNameTxt: UITextField!
    @IBOutlet weak var marketSize: UISlider!
    @IBOutlet weak var marketRate: UILabel!
    @IBOutlet weak var planUrl: BottomBorderTextField!
    @IBOutlet weak var planPros: UITextView!
    @IBOutlet weak var planCons: UITextView!
    
    @IBOutlet weak var addNewPlan: UIButton!
    @IBOutlet weak var addMoreMarket: UIButton!
    @IBOutlet weak var nextBtn: UIButtonDesignable!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        bindButtons()
    }




}
extension BusinessPlanOpportunitiesCreation {
    
    func bindButtons(){
        
        addMoreMarket.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        addNewPlan.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
        case addMoreMarket:
            print("")
        case addNewPlan:
            print("")
        case nextBtn:
            print("")
        default:
            print("")

        }
    }
    
    
}
