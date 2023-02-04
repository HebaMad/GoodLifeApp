//
//  HaveAnIdeaVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class HaveAnIdeaVC: UIViewController ,UITextFieldDelegate{
    
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
    @IBOutlet weak var defaultLocation: UIButtonDesignable!
    @IBOutlet weak var categoryTxt: UITextFieldDataPicker!
    //MARK: - Properties
    
    var presenter = MenuPresenter()
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
       
        monthlyRevenuTxt.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        setupDataPicker()
        setupTimePicker()
        bindBackButton()
    }
    
    //MARK: - setup Data Picker
    
    func setupDataPicker(){
        categoryTxt.dataSource=self
        categoryTxt.pickerDelegate=self
    }
    
    //MARK: - setupTimePicker

    fileprivate func setupTimePicker() {
        weeklyTimeSelection.setFormat(format: "HH:mm a")
        weeklyTimeSelection.setDatePickerMode(mode: .time)
    }
    
   @objc func textFieldDidChange(textField: UITextField){

      guard let text = textField.text else { return }
      
   
      if !text.hasPrefix("$") {
        textField.text = "$" + " " + text
      }
    }
}
//MARK: - Binding

private extension HaveAnIdeaVC{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        defaultLocation.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)

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
            
        case defaultLocation:
            print("")
        default:break
            
        }
    
  }
}
//MARK: - Create Idea request

extension HaveAnIdeaVC{
    
    
    func createIdea(){
        if  checkAllField() {
            
       
        do{
                let title = try titleProjectText.validatedText(validationType: .requiredField(field: "Title required"))
            if descriptionText.text.isEmpty != true {
                let time = try weeklyTimeSelection.validatedText(validationType: .requiredField(field: "Time commitment required"))
                let revenu = try monthlyRevenuTxt.validatedText(validationType: .requiredField(field: "Monthly revenu required"))
                presenter.createIdea(title: title, details: descriptionText.text, time_commitment: time, monthly_revenue: revenu)
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

extension HaveAnIdeaVC:MenuDelegate{
    func showAlerts(title: String, message: String) {
//        self.showAlert(title: title, message: message,hideCancelBtn: true)
        Alert.showSuccessAlert(message:message)
        clearData()

    }
    
    func getFunderData(data: WorthyCauses) {
        //No implementation here
    }
    
    
}


extension HaveAnIdeaVC{
    
    func clearData() {
        titleProjectText.text = ""
        monthlyRevenuTxt.text = ""
        weeklyTimeSelection.text = ""
        descriptionText.text = ""
    }
    
    func checkAllField() -> Bool{
        if !titleProjectText.text!.isEmpty || !monthlyRevenuTxt.text!.isEmpty || !weeklyTimeSelection.text!.isEmpty || !descriptionText.text!.isEmpty{
            
            return true
            
        }else{
            Alert.showErrorAlert(message:"Please enter the required data ")
//            self.showAlert(title: "Warning", message: "Please enter the required data ",hideCancelBtn: true)
            return false
            
        }
        
    }
}


//MARK: - confirm to DatePickerDelegate

extension HaveAnIdeaVC:UITextFieldDataPickerDelegate,UITextFieldDataPickerDataSource{
    
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, numberOfRowsInComponent component: Int) -> Int {
        2
    }
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, titleForRow row: Int, forComponent component: Int) -> String? {
        print("\(title ?? "")")
        return ""
    }
    
    func numberOfComponents(in textField: UITextFieldDataPicker) -> Int {
        1
    }
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, didSelectRow row: Int, inComponent component: Int) {
        
//        CategoryChoice.setTextFieldTitle(title: categories[row].title ?? "")
//        self.itemID=categories[row].id ?? 0
    }
    
    
}
