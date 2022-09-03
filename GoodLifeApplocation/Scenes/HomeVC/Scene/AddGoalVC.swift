//
//  AddGoalVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 10/08/2022.
//

import UIKit

class AddGoalVC: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate {

    
    //MARK: - Outlet
    
    @IBOutlet private(set) weak var AddBtn: UIButton!
    @IBOutlet private(set) weak var closeBtn: UIButton!
    @IBOutlet private(set) weak var deadlineTxt: DatePickingTextField!
    @IBOutlet private(set) weak var titleTxtfield: UITextField!
    @IBOutlet weak var categoryTxt: UITextFieldDataPicker!
    
    //MARK: - properties
    
    let presenter = DashboardPresenter()
    var categories:[Categories]=[]

    var itemID = 0
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getCategories()
        presenter.delegate=self
        bindBackButton()
        categoryTxt.pickerDelegate=self
        categoryTxt.dataSource=self
        setupTimePicker()
    
    }
    fileprivate func setupTimePicker() {
        deadlineTxt.setFormat(format: "YYYY-MM-dd HH:mm:ss")
        deadlineTxt.setDatePickerMode(mode: .dateAndTime)
    }

}

private extension AddGoalVC{
    
    func bindBackButton(){
        closeBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        AddBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
}

//MARK: - private Handler
private extension AddGoalVC{

    @objc func buttonWasTapped( _ sender:UIButton){
        
        switch sender{
    case AddBtn:
            
            do{
                
                let goalTitle = try titleTxtfield.validatedText(validationType: .requiredField(field: "Goal title required"))
                let deadline = try deadlineTxt.validatedText(validationType: .requiredField(field: "deadline requied"))
                if itemID != 0 {
                    
                    print(goalTitle)
                    print(deadline)
                    print("\(itemID)")

                    self.presenter.AddGoal(title: goalTitle, category_id: self.itemID, deadline:deadline )

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

extension AddGoalVC:DashboardDelegate{
    func getMyGoalAndBenchmark(data: GoalsAndBenchmark) {
        //
    }
    
    func showAlerts(title: String, message: String) {
        
    }
    
    func getCategories(data: [Categories]) {
        self.categories = data
    }
    
    func getResource(data: [Resources]) {
        // no implementation
    }
    
    func getMyTask(data: DashboardTask) {
        // no implementation

    }
    
    
}
extension AddGoalVC:UITextFieldDataPickerDelegate,UITextFieldDataPickerDataSource{

    
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
      
        categoryTxt.setTextFieldTitle(title: categories[row].title ?? "")
        self.itemID=categories[row].id ?? 0
    }
    
    
    
    
    
    
}
