//
//  LiturgicalOpportunitiesCreation.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/03/2023.
//

import UIKit

class LiturgicalOpportunitiesCreation: UIViewController {

    @IBOutlet weak var marketSize: UISlider!
    @IBOutlet weak var marketName: UITextField!
    @IBOutlet weak var marketRate: UILabel!
    
    @IBOutlet weak var addMoreMarket: UIButton!
    
    @IBOutlet weak var commonWayValueTxt: BottomBorderTextField!
    
    @IBOutlet weak var addMoreWays: UIButton!
    
    @IBOutlet weak var nextBtn: UIButtonDesignable!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        bindButtons()
    }




}
extension LiturgicalOpportunitiesCreation {
    
    func bindButtons(){
        
        addMoreMarket.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        addMoreWays.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
        case addMoreMarket:
            print("")
        case addMoreWays:
            print("")
        case nextBtn:
            print("")
        default:
            print("")

        }
    }
    
    
}
