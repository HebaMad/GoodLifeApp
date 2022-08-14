//
//  OpportunityViewVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit

class OpportunityViewVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var pastVenturesButton: UIButton!
    
    @IBOutlet weak var volunteerOpportunityButton: UIButton!
    
    @IBOutlet weak var AskHelpingButton: UIButton!

    @IBOutlet weak var haveIdeaButton: UIButton!
    
    
    @IBOutlet weak var AskingExperienceButton: UIButton!
    
    
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        bindButton()
    }

    @IBAction func pastVenAction(_ sender: UIButton) {
        let vc = PastVentures()
           navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func testAction(_ sender: Any) {
        let vc = PastVentures()
           navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - Binding
private extension OpportunityViewVC{
    
    private func bindButton(){
        pastVenturesButton.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        volunteerOpportunityButton.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        AskHelpingButton.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        haveIdeaButton.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        AskingExperienceButton.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)

    }
}

//MARK: - Private Handler

 extension OpportunityViewVC{
    @objc func buttonWasTapped(sender: UIButton){
        switch sender{
        case pastVenturesButton:
            
         let vc = PastVentures()
            navigationController?.pushViewController(vc, animated: true)
            
        case volunteerOpportunityButton:
            let vc = VolunteerOpportunityVC()
               navigationController?.pushViewController(vc, animated: true)
            
        case haveIdeaButton:
            let vc = HaveAnIdeaVC()
               navigationController?.pushViewController(vc, animated: true)
            
        case AskingExperienceButton:
            let vc = ReviewExperienceVC()
               navigationController?.pushViewController(vc, animated: true)
        default:
            print("")
        }

    }
}
