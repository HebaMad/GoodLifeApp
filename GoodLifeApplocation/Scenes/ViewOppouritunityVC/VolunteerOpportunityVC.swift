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
        
        eventDayTxt.setFormat(format: "YYYY/MM/dd")
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
        if checkAllField(){
         
        do{
            
                
                let title = try eventTitleText.validatedText(validationType: .requiredField(field: "Title required"))
                let date = try eventDayTxt.validatedText(validationType: .requiredField(field: "Date of event required"))
                let time = try eventTimeTxt.validatedText(validationType: .requiredField(field: "Time of event required"))
                let location = try locationOfEvent.validatedText(validationType: .requiredField(field: "Location required"))
            if eventDescriptionTxt.text.isEmpty != true {
                presenter.VolunteerOppourtinity(title: title, location: location, date: date, time: time, details: eventDescriptionTxt.text)
                presenter.delegate=self
                
            }else{
                Alert.showErrorAlert(message: "Description of idea required")
//                self.showAlert(title: "Warning", message: "Description of idea required",hideCancelBtn: true)
                
            }
            
        }catch{
            Alert.showErrorAlert(message: (error as! ValidationError).message)
//            self.showAlert(title: "Warning", message: (error as! ValidationError).message,hideCancelBtn: true)
            
        }
    }
    }
}


//MARK: - Confirm to Menu Delegate

extension VolunteerOpportunityVC:MenuDelegate{
    func showAlerts(title: String, message: String) {
//        self.showAlert(title: title, message: message,hideCancelBtn: true)
        Alert.showSuccessAlert(message:message)
        clearData()
    }
    
    func getFunderData(data: WorthyCauses) {
        //No implementation here
    }
}


extension VolunteerOpportunityVC {
    func clearData(){
        eventTimeTxt.text = ""
        eventDayTxt.text = ""
        eventDescriptionTxt.text = ""
        locationOfEvent.text = ""
        eventTitleText.text = ""
    }
    
    func checkAllField() -> Bool{
        if !eventTimeTxt.text!.isEmpty || !eventDayTxt.text!.isEmpty || !eventDescriptionTxt.text!.isEmpty || !locationOfEvent.text!.isEmpty || !eventTitleText.text!.isEmpty {
            
            return true
            
        }else{
            Alert.showErrorAlert(message:"Please enter the required data ")
//            self.showAlert(title: "Warning", message: "Please enter the required data ",hideCancelBtn: true)
            return false
            
        }
        
    }
}
