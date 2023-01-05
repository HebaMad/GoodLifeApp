//
//  EditProfileVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/08/2022.
//

import UIKit
import SDWebImage
class EditProfileVC: UIViewController {
    
    //MARK: - Outlet
    //Labels

    @IBOutlet weak var loctionTxt: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var userImage: UIImageViewDesignable!
    //Buttons
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    
    //MARK: - Properties
    
    var userProfile:userProfile?
    var selectedImage:Data?
    let presenter = ProfilePresenter()
    var pic:Data?
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        bindBackButton()
    }
    func setupData(){
        nameTxtField.text = userProfile?.name ?? ""
        phoneNumber.text = userProfile?.mobile ?? ""
        loctionTxt.text = userProfile?.location ?? ""
        userImage.sd_setImage(with: URL(string:userProfile?.image_profile ?? "" ))
    }
    
    @IBAction func selectPhotoBtn(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker,animated: true)
    }
   
}

extension EditProfileVC:UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return  }
        print(image)
        userImage.image=image
        selectedImage=image.jpegData(compressionQuality: 0.5)
     
        
    }
}
//MARK: - Binding

private extension EditProfileVC{
    
    func bindBackButton(){
        
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        saveBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)

    }
}

//MARK: - private Handler
private extension EditProfileVC{

    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
        case backBtn:
            navigationController?.popViewController(animated: true)

        case saveBtn:
             pic = selectedImage ?? userImage.image?.jpegData(compressionQuality: 0.3)
      print(pic)
    print( pic ?? Data())
            editProfile(name: nameTxtField.text ?? "", mobileNumber: phoneNumber.text ?? "" , location: loctionTxt.text ?? "", img: pic ?? Data())
        default:
            print("")
        }
  }
}


extension EditProfileVC{
    func editProfile(name:String,mobileNumber:String,location:String,img:Data){
        
        do{
            print(img)
            if pic != nil {
                let name = try nameTxtField.validatedText(validationType: .requiredField(field: "Name required"))
                let number = try phoneNumber.validatedText(validationType: .requiredField(field: "Number requied"))
                let location = try loctionTxt.validatedText(validationType: .requiredField(field: "Location requied"))
                
                self.presenter.editProfile(name: name, mobileNumber: number, location: location, img: img)
                self.presenter.delegate = self
            }else{
                Alert.showErrorAlert(message: "image required ")
            }
        }catch{
            Alert.showErrorAlert(message: (error as! ValidationError).message)

        }
        
    }
}

extension EditProfileVC:ProfileDelegate{
    func showAlerts(title: String, message: String) {
        Alert.showSuccessAlert(message: message)

    }
    
    func getUserData(data: userProfile) {
        //
    }
    
    func getUrlForWebPages(data: termsAndConditions) {
        //No implementation
    }
    
    
    
}
