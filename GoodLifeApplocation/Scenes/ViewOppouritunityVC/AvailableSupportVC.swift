//
//  AvailableSupportVC.swift
//  GoodLifeApplocation
//  Created by heba isaa on 14/02/2023.

import UIKit


protocol transferedData{
   func  getData(data:String)
}
class AvailableSupportVC: UIViewController ,UITextFieldDataPickerDelegate , UITextFieldDataPickerDataSource{

    @IBOutlet weak var availableMoney: UITextFieldDataPicker!
    var onSheetDissmissed:transferedData?
    
    let availableMoneyRange : [String] = [ "<$100","$100 to $500" , "$500 to $1,000" , "$1,000 to $2,500","$2,500 to $5,000" , "$5,000 to $10,000","$10,000 to $25,000" , "$25,000 to $50,000" , "$50,000 to $100,000" ,"$100,000 to $250,000" , "$250,000 to $500,000" , "$500,000 to $1,000,000" , ">$1,000,000" ]
    
    
    let presenter=MenuPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMoneyData()
    }

    @IBAction func saveBtn(_ sender: Any) {
        if self.availableMoney.text != "" {
            
            presenter.updateAvailableSupportMoney(availableSupportMoney: self.availableMoney.text!)
            presenter.delegate=self
            self.dismiss(animated: true) {
                if let _delegate = self.onSheetDissmissed{
                    _delegate.getData(data:self.availableMoney.text!)
                }
            }
        }
    }
    func getMoneyData() {
        availableMoney.pickerDelegate=self
        availableMoney.dataSource=self
    }

}


extension AvailableSupportVC {
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, didSelectRow row: Int, inComponent component: Int) {
        availableMoney.setTextFieldTitle(title: availableMoneyRange[row])
    }
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, numberOfRowsInComponent component: Int) -> Int {
        availableMoneyRange.count
    }
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, titleForRow row: Int, forComponent component: Int) -> String? {
        availableMoneyRange[row]
    }
    
    func numberOfComponents(in textField: UITextFieldDataPicker) -> Int {
        1
    }
}

extension AvailableSupportVC:MenuDelegate{
    func getCategories(data: FundTyps) {
        
    }
    
    func showAlerts(title: String, message: String) {
        Alert.showErrorAlert(message: message)

    }
    
    func getFunderData(data: WorthyCauses) {}
    
    func getFundTypeData(data: FundType) { }
    
    func getMyResource(data: StewardingMyResource) { }
    
    
}
