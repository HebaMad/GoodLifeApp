//
//  DigitalOpportunitiesCreation.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/03/2023.
//

import UIKit

class DigitalOpportunitiesCreation: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var opportunitiesUrl: BottomBorderTextField!
    
    @IBOutlet weak var competitorUrl: BottomBorderTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindButtons()

    }
}

extension DigitalOpportunitiesCreation{
    func bindButtons(){
        nextBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        addBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
        case nextBtn:
            print("")
        case addBtn:
            print("")
        default:
            print("")

        }
    }
}
