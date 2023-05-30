
//  Created by heba isaa on 24/07/2022.
//

import UIKit

class OpportunityViewVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var createOppourtinity: OpportunityView!
    @IBOutlet weak var AddFundTypeView: OpportunityView!
    @IBOutlet weak var VolunteerOpportunityView: OpportunityView!
    @IBOutlet weak var HaveIdeaView: OpportunityView!
    @IBOutlet weak var experienceView: OpportunityView!
    @IBOutlet weak var DonationView: OpportunityView!
    @IBOutlet weak var rewardingResourceView: OpportunityView!
    @IBOutlet weak var logoutView: OpportunityView!
    
    
    let presenter = ProfilePresenter()
    let stewardingResourcePresenter = MenuPresenter()
    var userProfile:userProfile?
    var stewardingResourceData:StewardingMyResource?
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindButtons()
        getPresenterRequest()
    }
    
    func getPresenterRequest(){
        presenter.userProfile()
        presenter.delegate=self
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stewardingResourcePresenter.getStewardingMyResource()
        stewardingResourcePresenter.delegate=self
    }
    
}

//MARK: - Binding

extension OpportunityViewVC{
    
    func bindButtons(){
        VolunteerOpportunityView.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        HaveIdeaView.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        experienceView.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        DonationView.ViewBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
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
                        
        case VolunteerOpportunityView.ViewBtn:
            
            let vc = VolunteerOpportunityVC()
            vc.status="Add"
            navigationController?.pushViewController(vc, animated: true)
            
        case HaveIdeaView.ViewBtn:
            
            let vc = HaveAnIdeaVC()
            vc.status="Add"
            navigationController?.pushViewController(vc, animated: true)
            
        case experienceView.ViewBtn:
            let vc = ReviewExperienceVC()
            navigationController?.pushViewController(vc, animated: true)
            
        case DonationView.ViewBtn:
            let vc = DonationVC()
            navigationController?.pushViewController(vc, animated: true)

            
        case createOppourtinity.ViewBtn:
            print("")
            let vc =  CreateOppourtinityVC.instantiate()
            navigationController?.pushViewController(vc, animated: true)

            
        case AddFundTypeView.ViewBtn:
            let vc = AddFundTypes()
            navigationController?.pushViewController(vc, animated: true)
        case rewardingResourceView.ViewBtn:
            let vc = StewardingMyResourcesVC.instantiate()
            vc.stewardingResourceData=stewardingResourceData
            navigationController?.pushViewController(vc, animated: true)
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
    func getIdea(data: MinistryIdea) {}
    
    func getVolunteerRequest(data: VolunteerRequests) {}
    
    func showAlerts(title: String, message: String) { }
    
    func getUserData(data: userProfile) {
        self.userProfile = data
    }
    
    func getUrlForWebPages(data: termsAndConditions) {}
}

extension OpportunityViewVC:MenuDelegate{
    func getCategories(data: FundTyps) {
    }
    
    
    func getFunderData(data: WorthyCauses) {}
    
    func getFundTypeData(data: FundType) {}
    
    func getMyResource(data: StewardingMyResource) {
        stewardingResourceData=data
    }
    
    
}
