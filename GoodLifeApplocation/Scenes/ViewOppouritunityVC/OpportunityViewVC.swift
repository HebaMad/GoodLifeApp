//
//  OpportunityViewVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit

class OpportunityViewVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var Profile: OpportunityView!
    @IBOutlet weak var VolunteerOpportunityView: OpportunityView!
    @IBOutlet weak var HaveIdeaView: OpportunityView!
    @IBOutlet weak var experienceView: OpportunityView!
    @IBOutlet weak var DonationView: OpportunityView!
    
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindButton()
    }
    
    func bindButton(){
        Profile.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        VolunteerOpportunityView.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        HaveIdeaView.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        experienceView.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        DonationView.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
}

//MARK: - Private Handler

 extension OpportunityViewVC{
     @objc func buttonWasTapped( sender: UIButton){
         
         switch sender{
             
             case Profile.ViewBtn:
             let vc = ProfileVC.instantiate()
             navigationController?.pushViewController(vc, animated: true)

             case VolunteerOpportunityView.ViewBtn:
             let vc = VolunteerOpportunityVC()
             navigationController?.pushViewController(vc, animated: true)
             
             case HaveIdeaView.ViewBtn:
        
             let vc = HaveAnIdeaVC()
             navigationController?.pushViewController(vc, animated: true)
             
             case experienceView.ViewBtn:
             let vc = ReviewExperienceVC()
             navigationController?.pushViewController(vc, animated: true)
             
             case DonationView.ViewBtn:
             let vc = DonationVC()
             navigationController?.pushViewController(vc, animated: true)
             
         default:
             print("")
         }
      
     }
}
