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
    @IBOutlet weak var titleProjectText: UITextField!
    @IBOutlet weak var projectReview: UITextView!
    @IBOutlet weak var reviewRate: RatingControl!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var addDocumentBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!

    
    //MARK: - Properties
    var presenter = MenuPresenter()
    var selectedImage:Data?

    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

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

            let title = try titleProjectText.validatedText(validationType: .requiredField(field: "price required"))
            if projectReview.text.isEmpty != true{
                
                presenter.createFeedback(title: title, review: projectReview.text, rate: reviewRate.rating, img: selectedImage ?? Data())
                presenter.delegate=self

            }else{
                self.showAlert(title: "Warning", message:" Review text required ",hideCancelBtn: true)

            }
            
        }catch{
            self.showAlert(title: "Warning", message: (error as! ValidationError).message,hideCancelBtn: true)

        }
    }
    
   
}

//MARK: - Confirm to Menu Delegate


extension ReviewExperienceVC:MenuDelegate{
    
    func showAlerts(title: String, message: String) {
        self.showAlert(title: title, message: message,hideCancelBtn: true)
        clearData()

    }
    
    func getFunderData(data: WorthyCauses) {
        //No implementation here
    }
    
    
}
extension ReviewExperienceVC {
    func clearData(){
        titleProjectText.text = ""
        projectReview.text = ""
    }
}
