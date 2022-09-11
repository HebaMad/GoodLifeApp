//
//  HaveAnIdeaVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class HaveAnIdeaVC: UIViewController {
    
    //MARK: - Outlet

    @IBOutlet weak var coverImage: UIImageViewDesignable!
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var titleProjectText: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var weeklyTimeSelection: DatePickingTextField!
    @IBOutlet weak var monthlyRevenuTxt: UITextField!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButtonDesignable!
    
    //MARK: - Properties
    
    var presenter = MenuPresenter()
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTimePicker()
        bindBackButton()
    }
    
    //MARK: - setupTimePicker

    fileprivate func setupTimePicker() {
        weeklyTimeSelection.setFormat(format: "HH:mm:ss")
        weeklyTimeSelection.setDatePickerMode(mode: .time)
    }
}
//MARK: - Binding

private extension HaveAnIdeaVC{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)

    }
}
//MARK: - private Handler
private extension HaveAnIdeaVC{

    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
        case backBtn:
            navigationController?.popViewController(animated: true)

        case nextBtn:
            createIdea()
        default:break
            
        }
    
  }
}
//MARK: - Create Idea request

extension HaveAnIdeaVC{
    
    
    func createIdea(){
        
        do{
            if descriptionText.text.isEmpty != true {
                let title = try titleProjectText.validatedText(validationType: .requiredField(field: "title required"))
                let revenu = try monthlyRevenuTxt.validatedText(validationType: .requiredField(field: "monthly revenu required"))
                let time = try weeklyTimeSelection.validatedText(validationType: .requiredField(field: "time commitment required"))

                presenter.createIdea(title: title, details: descriptionText.text, time_commitment: time, monthly_revenue: revenu)
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

extension HaveAnIdeaVC:MenuDelegate{
    func showAlerts(title: String, message: String) {
        self.showAlert(title: title, message: message,hideCancelBtn: true)

    }
    
    func getFunderData(data: WorthyCauses) {
        //No implementation here
    }
    
    
}
