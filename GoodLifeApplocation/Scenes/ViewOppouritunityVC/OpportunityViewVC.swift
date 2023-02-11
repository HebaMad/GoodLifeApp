//
//  OpportunityViewVC.swift/Users/hebaisaa/Documents/GoodLifeApplocation/GoodLifeApplocation/Scenes/ViewOppouritunityVC/OpportunityViewVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit

class OpportunityViewVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var createOppourtinity: OpportunityView!
    @IBOutlet weak var viewAllOppourtinity: OpportunityView!
    @IBOutlet weak var AddFundTypeView: OpportunityView!
    @IBOutlet weak var Profile: OpportunityView!
    @IBOutlet weak var VolunteerOpportunityView: OpportunityView!
    @IBOutlet weak var HaveIdeaView: OpportunityView!
    @IBOutlet weak var experienceView: OpportunityView!
    @IBOutlet weak var DonationView: OpportunityView!
    @IBOutlet weak var rewardingResourceView: OpportunityView!
    @IBOutlet weak var logoutView: OpportunityView!
    
    
    let presenter = ProfilePresenter()

    var userProfile:userProfile?
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindButtons()
        presenter.userProfile()
        presenter.delegate=self
    }
  
}

     //MARK: - Binding

extension OpportunityViewVC{
    
    func bindButtons(){
        Profile.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        VolunteerOpportunityView.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        HaveIdeaView.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        experienceView.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        DonationView.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        viewAllOppourtinity.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        createOppourtinity.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        rewardingResourceView.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        logoutView.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        AddFundTypeView.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
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
             
         case viewAllOppourtinity.ViewBtn:
             
             let vc = MapVC()
             navigationController?.pushViewController(vc, animated: true)
             
         case createOppourtinity.ViewBtn:
             print("")
             
//             let vc = CreateOppourtinityVC()
//             navigationController?.pushViewController(vc, animated: true)
             
         case AddFundTypeView.ViewBtn:
             let vc = AddFundTypes()
             navigationController?.pushViewController(vc, animated: true)
         case rewardingResourceView.ViewBtn:
             print("")
             
         case logoutView.ViewBtn:
             print("")
             
             self.showAlertPopUp(title: "Notice", message: "Do you want to logout?", buttonTitle1: "Ok", buttonTitle2: "Cancel", buttonTitle1Style: .default, buttonTitle2Style: .cancel) {
                 do{
                     try KeychainWrapper.set(value:"" , key: self.userProfile?.mobile ?? "")
                     AppData.mobile = self.userProfile?.mobile ?? ""
                     self.presenter.logout()

                   } catch let error {
                     print(error)
               }

             } action2: {
                 
             }

      

         default:
             print("")
         }
      
     }
}

extension OpportunityViewVC:ProfileDelegate{
    func showAlerts(title: String, message: String) {
        
    }
    
    func getUserData(data: userProfile) {
        self.userProfile = data
    }
    
    func getUrlForWebPages(data: termsAndConditions) {
    }
    
    
}
