//
//  DigitalOpportunitiesCreation.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/03/2023.
//

import UIKit

class DigitalOpportunitiesCreation: UIViewController {

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var opportunitiesUrl: BottomBorderTextField!
    
    @IBOutlet weak var competitorUrl: BottomBorderTextField!
    
    
    var competitorsUrl:[String]=[]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindButtons()

    }
    
    
}

extension DigitalOpportunitiesCreation{
    func bindButtons(){
        addBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
  
        case addBtn:
            if competitorUrl.text != ""{
                competitorsUrl.append(competitorUrl.text!)
                competitorUrl.text=""
            }else{
                showSnackBar(message: "Add your Financial Model ")
            }

        default:
            print("")
        }
    }
}
