//
//  Volunteer OpportunityVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit

class VolunteerOpportunityVC: UIViewController {
    //MARK: - Outlet

    @IBOutlet weak var eventTimeTxt: UITextField!
    @IBOutlet weak var eventDayTxt: UITextField!
    @IBOutlet weak var eventDescriptionTxt: UITextView!
    @IBOutlet weak var locationOfEvent: UITextField!
    @IBOutlet weak var eventTitleText: UITextField!
    @IBOutlet weak var backBtn: UIButton!

    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bindBackButton()
    }
}
//MARK: - Binding

private extension VolunteerOpportunityVC{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
}
//MARK: - private Handler
private extension VolunteerOpportunityVC{

   @objc func buttonWasTapped(){
       navigationController?.popViewController(animated: true)
    
  }
}
