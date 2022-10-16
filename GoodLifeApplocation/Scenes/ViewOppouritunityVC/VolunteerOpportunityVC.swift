//
//  Volunteer OpportunityVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit

class VolunteerOpportunityVC: UIViewController {
    //MARK: - Outlet

    @IBOutlet weak var eventTimeTxt: DatePickingTextField!
    @IBOutlet weak var eventDayTxt: DatePickingTextField!
    @IBOutlet weak var eventDescriptionTxt: UITextView!
    @IBOutlet weak var locationOfEvent: UITextField!
    @IBOutlet weak var eventTitleText: UITextField!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!

    //MARK: - Properties
    
    let presenter = MenuPresenter()

    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bindBackButton()
        setupTimePicker()
    }
    
    //MARK: - setup Date picker

    fileprivate func setupTimePicker() {
        
        eventTimeTxt.setFormat(format: "HH:mm:ss")
        eventTimeTxt.setDatePickerMode(mode: .time)
        
        eventDayTxt.setFormat(format: "YYYY-MM-dd")
        eventDayTxt.setDatePickerMode(mode: .date)
        
    }
}
     //MARK: - Binding

private extension VolunteerOpportunityVC{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)

    }
}

    //MARK: - private Handler
private extension VolunteerOpportunityVC{

    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
        case backBtn:
            navigationController?.popViewController(animated: true)

        case nextBtn:
            
            volunteerOpportunity()
        default:break
            
        }
    
  }
}


     //MARK: - Create Event Request

extension VolunteerOpportunityVC{
    
    
    func volunteerOpportunity(){
        
        do{
            if eventDescriptionTxt.text.isEmpty != true {
                
                let title = try eventTitleText.validatedText(validationType: .requiredField(field: "title required"))
                let date = try eventDayTxt.validatedText(validationType: .requiredField(field: "date of event required"))
                let time = try eventTimeTxt.validatedText(validationType: .requiredField(field: "time of event required"))
                let location = try locationOfEvent.validatedText(validationType: .requiredField(field: "location required"))

                presenter.VolunteerOppourtinity(title: title, location: location, date: date, time: time, details: eventDescriptionTxt.text)
                presenter.delegate=self

            }else{
                self.showAlert(title: "Warning", message: "Description of idea required",hideCancelBtn: true)

            }
     
        }catch{
            self.showAlert(title: "Warning", message: (error as! ValidationError).message,hideCancelBtn: true)

        }
    }
}


      //MARK: - Confirm to Menu Delegate

extension VolunteerOpportunityVC:MenuDelegate{
    func showAlerts(title: String, message: String) {
        self.showAlert(title: title, message: message,hideCancelBtn: true)

    }
    
    func getFunderData(data: WorthyCauses) {
        //No implementation here
    }
    
    
}
