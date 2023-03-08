//
//  HaveAnIdeaVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit
import MapKit

class HaveAnIdeaVC: UIViewController ,UITextFieldDelegate{
    
    //MARK: - Outlet
    
    @IBOutlet weak var locationTxt: UITextField!
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
    var latitude=0.0
    var longitude=0.0
    var presenter = MenuPresenter()
    var fundTypeID=0
    var fundTypeData:[mainType]=[]
    var status=""
    var ministryIdeaID=0
    var ministryIDEA:MinistryIdea?

    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getFundType()
        presenter.delegate=self
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
        weeklyTimeSelection.setFormat(format: "HH:mm")
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
            navigationController?.popToRootViewController(animated: true)

        case nextBtn:
            createIdea()
            
        case defaultLocation:
            getCurrentLocation()
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
                    let loc = try locationTxt.validatedText(validationType: .requiredField(field: "location required"))
                    
                    if status == "Add"{
                        
                        presenter.createIdea(title: title, details: descriptionText.text, time_commitment: time, monthly_revenue: revenu,fund_type_id: "\(self.fundTypeID)",location:loc)
                    }else{
                        presenter.updateMinistryIdea(ministryIdeaID:"\(ministryIdeaID)" , title: title, details: descriptionText.text, time_commitment: time, monthly_revenue: revenu,fund_type_id: "\(self.fundTypeID)",location:loc)
                    }
               
                    presenter.delegate=self
                    
                }else{
                    Alert.showErrorAlert(message: "Description of idea required")
                    
                }
                
            }catch{
                Alert.showErrorAlert(message: (error as! ValidationError).message)
            }
        }
    }
}

//MARK: - Confirm to Menu Delegate

extension HaveAnIdeaVC:MenuDelegate{
    
    func getMyResource(data: StewardingMyResource) {}
    
    func getFundTypeData(data: FundType) {
        fundTypeData=data.fund_types ?? []
    }
    
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
        locationTxt.text = ""
        categoryTxt.text = ""

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
    
    func getCurrentLocation(){
        LocationManager.shared.getLocation { [self] location, error in
            let center = CLLocationCoordinate2DMake((location?.coordinate.latitude) ?? latitude , (location?.coordinate.longitude) ?? longitude)
            latitude=location?.coordinate.latitude ?? 0.0
            longitude=location?.coordinate.longitude ?? 0.0
            
            LocationManager.shared.getAddressFromLatLon(pdblLatitude: "\(self.latitude)", withLongitude: "\(self.longitude)") { status, mapaddress, mapcountry in
                
                self.locationTxt.text=mapaddress
                
            }
        }
    }
}


//MARK: - confirm to DatePickerDelegate

extension HaveAnIdeaVC:UITextFieldDataPickerDelegate,UITextFieldDataPickerDataSource{
    
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, numberOfRowsInComponent component: Int) -> Int {
        return fundTypeData.count
    }
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return fundTypeData[row].name
    }
    
    func numberOfComponents(in textField: UITextFieldDataPicker) -> Int {
        1
    }
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, didSelectRow row: Int, inComponent component: Int) {
        self.fundTypeID=fundTypeData[row].id ?? 0
        categoryTxt.setTextFieldTitle(title: fundTypeData[row].name ?? "")
    }
    
    
}
