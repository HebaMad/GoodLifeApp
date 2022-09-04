//
//  ProfileSettingVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/08/2022.
//

import UIKit

class ProfileSettingVC: UIViewController {
    
    
    //MARK: - Outlet
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var profileEditView: SettingNib!
    @IBOutlet weak var contactusView: SettingNib!
    @IBOutlet weak var privacyPolicy: SettingNib!
    @IBOutlet weak var logoutBtn: UIButtonDesignable!
    @IBOutlet weak var termAndConditionView: SettingNib!
    
    //MARK: - Properties
    
    let presenter = ProfilePresenter()
    var TermsAndConditionUrl = ""
    var privacyPolicyUrl = ""
    var userProfile:userProfile?
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindButtons()
        presenter.termsAndCondition()
        presenter.userProfile()
        presenter.delegate=self
    }
    
}
//MARK: - Binding

extension ProfileSettingVC{
    private func bindButtons(){
        
        profileEditView.ViewBtn.addTarget(self, action: #selector(ButtonWasTapped), for: .touchUpInside)
        contactusView.ViewBtn.addTarget(self, action: #selector(ButtonWasTapped), for: .touchUpInside)
        privacyPolicy.ViewBtn.addTarget(self, action: #selector(ButtonWasTapped), for: .touchUpInside)
        termAndConditionView.ViewBtn.addTarget(self, action: #selector(ButtonWasTapped), for: .touchUpInside)
        logoutBtn.addTarget(self, action: #selector(ButtonWasTapped), for: .touchUpInside)
        backBtn.addTarget(self, action: #selector(ButtonWasTapped), for: .touchUpInside)

    }
}
//MARK: - Private Handler

extension ProfileSettingVC{
    @objc func ButtonWasTapped( sender:UIButton){
        switch sender{
            
        case profileEditView.ViewBtn:
            
            let vc = EditProfileVC()
            vc.userProfile = self.userProfile
            navigationController?.pushViewController(vc, animated: true)
            
        case contactusView.ViewBtn:
            
            let vc = ContactUsVC()
            navigationController?.pushViewController(vc, animated: true)
            
        case privacyPolicy.ViewBtn:
            
            
            let vc = TermsAndConditions()
            vc.url = self.privacyPolicyUrl
            navigationController?.pushViewController(vc, animated: true)
            
        case termAndConditionView.ViewBtn:
            
            let vc = TermsAndConditions()
            vc.url = self.TermsAndConditionUrl
            self.navigationController?.pushViewController(vc, animated: true)
            
        case logoutBtn:
            self.showAlertPopUp(title: "", message: "Do you want to logout?") {
                do{
                    self.presenter.logout()
//                    try KeychainWrapper.set(value: "" , key: email )
//                    AppData.email = email

                }catch let error {
   
            }
                
            } action2: {
                
            }
            
        case backBtn:
            navigationController?.popViewController(animated: true)
        default:
            print("")
        }
    }
}

extension ProfileSettingVC:ProfileDelegate{
    func showAlerts(title: String, message: String) {
        self.sceneDelegate.setRootVC(vc: SplashScreen())
        
    }
    
    func getUserData(data: userProfile) {
        self.userProfile = data
    }
    
    func getUrlForWebPages(data: termsAndConditions) {
        self.TermsAndConditionUrl = data.url ?? ""
    }
    
    
}
