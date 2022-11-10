//
//  AddTask.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 10/08/2022.
//

import UIKit

class AddTaskVC: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate  {

    
    //MARK: - Outlet
    
    @IBOutlet private(set) weak var AddBtn: UIButton!
    @IBOutlet private(set) weak var closeBtn: UIButton!
    @IBOutlet weak var CategoryChoice: UITextFieldDataPicker!
    @IBOutlet private(set) weak var titleTxtfield: UITextField!
    @IBOutlet private(set) weak var alertSwitch: UISwitch!
    @IBOutlet weak var startDate: DatePickingTextField!
    @IBOutlet weak var endDate: DatePickingTextField!
    
    
    //MARK: - Properties
    
    let presenter = DashboardPresenter()
    var categories:[Categories]=[]
    var itemID = 0
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getCategories(opportunity_id: UserDefaults.standard.integer(forKey: "id"), searchTxt: "")
        presenter.delegate=self
        bindBackButton()
        CategoryChoice.pickerDelegate=self
        CategoryChoice.dataSource=self
        setupTimePicker()
    
    }
    
    //MARK: - Setup Time Picker

    fileprivate func setupTimePicker() {
        startDate.setFormat(format: "YYYY-MM-dd HH:mm:ss")
        startDate.setDatePickerMode(mode: .dateAndTime)
        
        endDate.setFormat(format: "YYYY-MM-dd HH:mm:ss")
        endDate.setDatePickerMode(mode: .dateAndTime)
    }

}

//MARK: - Binding

private extension AddTaskVC{
    
    func bindBackButton(){
        closeBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        AddBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)

    }
    
    
}
//MARK: - private Handler
private extension AddTaskVC{

    @objc func buttonWasTapped( _ sender:UIButton){
       
        switch sender{
   case AddBtn:
           
           do{
               
               let taskTitle = try titleTxtfield.validatedText(validationType: .requiredField(field: "Goal title required"))
               let taskStartDate = try startDate.validatedText(validationType: .requiredField(field: "deadline requied"))
               let taskEndDate = try endDate.validatedText(validationType: .requiredField(field: "deadline requied"))

               if itemID != 0 {
                   

                   self.presenter.AddTask(title: taskTitle, category_id: itemID, all_days: alertSwitch.isOn == true ? "yes" : "no" , start_date: taskStartDate, end_date: taskEndDate)
                   self.presenter.delegate = self

               }else{
                   self.showAlert(title: "Notice", message: "select your category",hideCancelBtn: true)
               }

           }catch{
               
               self.showAlert(title: "Warning", message: (error as! ValidationError).message,hideCancelBtn: true)

           }
   case closeBtn:
       navigationController?.popViewController(animated: true)
    
        default:
            print("")
        }
}
}

//MARK: - confirm to DashboardDelegate

extension AddTaskVC:DashboardDelegate{
    
    func getNotification(data: AllNotifiaction) { }
    func getMyGoalAndBenchmark(data: GoalsAndBenchmark) { }
    func getResource(data: [Resources]) {}
    func getMyTask(data: DashboardTask) {}
    func getResourceDetails(data: ResourceDetails) {}
    
    func showAlerts(title: String, message: String) {
        self.showAlert(title: title, message: message,hideCancelBtn: true)
        clearData()
    }
    
    func getCategories(data: DahboardCategory) {

        self.categories = data.categories ?? []
    }
    

    
    
}
//MARK: - confirm to DatePickerDelegate

extension AddTaskVC:UITextFieldDataPickerDelegate,UITextFieldDataPickerDataSource{

    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, numberOfRowsInComponent component: Int) -> Int {
        categories.count
    }
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, titleForRow row: Int, forComponent component: Int) -> String? {
print("\(title ?? "")")
        return categories[row].title
    }
    
    func numberOfComponents(in textField: UITextFieldDataPicker) -> Int {
        1
    }
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, didSelectRow row: Int, inComponent component: Int) {
      
        CategoryChoice.setTextFieldTitle(title: categories[row].title ?? "")
        self.itemID=categories[row].id ?? 0
    }
   
    
}
//MARK: - Clear Data After Add

extension AddTaskVC{
    func clearData(){
        titleTxtfield.text = ""
        CategoryChoice.text = ""
        startDate.text = ""
        endDate.text = ""
    }
}
