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
    @IBOutlet weak var termAndConditionView: SettingNib!
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindButtons()
    }
   
}
//MARK: - Binding

extension ProfileSettingVC{
    private func bindButtons(){
        profileEditView.ViewBtn.addTarget(self, action: #selector(ButtonWasTapped), for: .touchUpInside)
        contactusView.ViewBtn.addTarget(self, action: #selector(ButtonWasTapped), for: .touchUpInside)
        privacyPolicy.ViewBtn.addTarget(self, action: #selector(ButtonWasTapped), for: .touchUpInside)
        termAndConditionView.ViewBtn.addTarget(self, action: #selector(ButtonWasTapped), for: .touchUpInside)
    }
}
//MARK: - Private Handler

extension ProfileSettingVC{
    @objc func ButtonWasTapped( sender:UIButton){
        switch sender{
            
        case profileEditView.ViewBtn:
            let vc = EditProfileVC()
            navigationController?.pushViewController(vc, animated: true)
            
        case contactusView.ViewBtn:
            let vc = ContactUsVC()
            navigationController?.pushViewController(vc, animated: true)
            
        case privacyPolicy.ViewBtn:
            
            let vc = HaveAnIdeaVC()
            
            
        case termAndConditionView.ViewBtn:
            let vc = ReviewExperienceVC()
            
        case backBtn:
            navigationController?.popViewController(animated: true)
        default:
            print("")
        }
    }
}
