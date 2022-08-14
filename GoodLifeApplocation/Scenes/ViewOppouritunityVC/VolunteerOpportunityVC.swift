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
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = false
    }


    
    

}
