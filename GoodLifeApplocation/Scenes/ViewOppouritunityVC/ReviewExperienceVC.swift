//
//  ReviewExperienceVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class ReviewExperienceVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var coverImage: UIImageViewDesignable!
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var projectReview: UITextView!
    @IBOutlet weak var reviewRate: RatingControl!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var addDocumentBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var categoryTxt: UITextFieldDataPicker!
    
    
    //MARK: - Properties
    var presenter = MenuPresenter()
    var selectedImage:Data?
    var oppourtinity:[OppourtinityDetails] = []
    var categoryPresenter = HomePresenter()
    var itemID:Int=0
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTxt.isEnabled = false
        categoryPresenter.getSmartRecommendation(interestId: 0, needTypeId: 0)
        categoryPresenter.delegate = self
        bindBackButton()
   
    }
}
//MARK: - Binding

private extension ReviewExperienceVC{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        addDocumentBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
    }
}
//MARK: - private Handler
private extension ReviewExperienceVC{
    
    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
        case backBtn:
            navigationController?.popViewController(animated: true)
            
        case nextBtn:
            reviewExperience()
            
        case addDocumentBtn:
            addPhotoAndVideo()
        default: break
            
        }
        
    }
    func addPhotoAndVideo(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker,animated: true)
    }
}

//MARK: - confirm to UIImagePicker Delegate

   extension ReviewExperienceVC:UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return  }
        print(image)
        selectedImage=image.jpegData(compressionQuality: 0.5)
        
        
    }
}


//MARK: - Review Experience request

   extension ReviewExperienceVC{
    
    func reviewExperience(){
        do{
            
            let title = try categoryTxt.validatedText(validationType: .requiredField(field: "category required"))
            if reviewRate.rating != 0 {
            if projectReview.text.isEmpty != true{
                
                presenter.createFeedback(id:"\(itemID)", review: projectReview.text, rate: reviewRate.rating, img: selectedImage ?? Data())
                presenter.delegate=self
                
            }else{
                Alert.showErrorAlert(message: "Review text required ")
//                self.showAlert(title: "Warning", message:" Review text required ",hideCancelBtn: true)
                
            }
            }else{
                Alert.showErrorAlert(message: "Review  your experience please")
//                self.showAlert(title: "Warning", message:" Review  your experience please",hideCancelBtn: true)

            }
        }catch{
            Alert.showErrorAlert(message: (error as! ValidationError).message)
//            self.showAlert(title: "Warning", message: (error as! ValidationError).message,hideCancelBtn: true)
            
        }
    }
    
    
}

//MARK: - Confirm to Menu Delegate


   extension ReviewExperienceVC:MenuDelegate{
    
    func showAlerts(title: String, message: String) {
//        self.showAlert(title: title, message: message,hideCancelBtn: true)
        Alert.showSuccessAlert(message:message)
        clearData()
        
    }
    func getFunderData(data: WorthyCauses) { }
}


   extension ReviewExperienceVC:HomeDelegate{
    
    func getCategories(categories: Home) {}
    func getStandardCategoriesFiltering(categories: MainHomeCategories) {}
    func getsubCategoriesFiltering(categories: SubHomeCategories) {}
    func getCategoriesFiltered(categories: Home) {}
    func getOppourtinityDetails(categories: OppourtinityDetails) {}
    
    func getOppourtinity(categories: Oppourtinity) {
        print(self.oppourtinity.count)
        self.oppourtinity = categories.items ?? []
        print(self.oppourtinity)
        categoryTxt.isEnabled = true

        categoryTxt.pickerDelegate=self
        categoryTxt.dataSource=self
    }
    
}

    extension ReviewExperienceVC {
    func clearData(){
        categoryTxt.text = ""
        projectReview.text = ""
    }
}

   extension ReviewExperienceVC:UITextFieldDataPickerDelegate,UITextFieldDataPickerDataSource{
    
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, numberOfRowsInComponent component: Int) -> Int {
        oppourtinity.count
    }
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, titleForRow row: Int, forComponent component: Int) -> String? {
        print("\(title ?? "")")
        return " " + (oppourtinity[row].title ?? "")
    }
    
    func numberOfComponents(in textField: UITextFieldDataPicker) -> Int {
        1
    }
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, didSelectRow row: Int, inComponent component: Int) {
        
        categoryTxt.setTextFieldTitle(title: " " + (oppourtinity[row].title ?? ""))
        self.itemID=oppourtinity[row].id ?? 0
    }
    
    
}
