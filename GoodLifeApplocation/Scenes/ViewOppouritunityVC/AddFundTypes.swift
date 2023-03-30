//
//  AddFundTypes.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 11/02/2023.
//

import UIKit
import MapKit

class AddFundTypes: UIViewController {
    //MARK: - Outlet

    @IBOutlet weak var cityTxt: UITextField!
    @IBOutlet weak var pointName: UITextField!
    @IBOutlet weak var defaultPointSwitch: UISwitch!
    
    @IBOutlet weak var categoryImage: UIImageViewDesignable!
    @IBOutlet weak var mainCategoryTxt: UITextFieldDataPicker!
    @IBOutlet weak var subCategoryTxt: UITextFieldDataPicker!
    
    @IBOutlet weak var latitudetxt: UITextField!
    @IBOutlet weak var longitudeTxt: UITextField!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var addCategoryBtn: UIButtonDesignable!
    @IBOutlet weak var currentLocationBtn: UIButton!
    @IBOutlet weak var AddImg: UIButton!
    //MARK: - Properties
    
    let presenter=MainPresenter()
    var mainCategory:[MainCategories]=[]
    var subCategory:[MainCategories]=[]
    var mainCategoryID=0
    var subCategoryID=0
    var latitude=0.0
    var longitude=0.0

    //MARK: - Properties

    override func viewDidLoad() {
        super.viewDidLoad()

        getCategoryData()
    }

    //MARK: - life cycle

    func getCategoryData(){
        bindBackButton()
        presenter.mainStandardFilter()
        presenter.delegate = self
        
        presenter.subStandardFilter()
        presenter.delegate = self
        
    }

}
//MARK: - Binding

private extension AddFundTypes{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        addCategoryBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        AddImg.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        currentLocationBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
        defaultPointSwitch.addTarget(self, action: #selector(switchButtonWasTapped), for: .valueChanged)
    }
}
//MARK: - private Handler
private extension AddFundTypes  {
    
    @objc func buttonWasTapped(_ sender:UIButton){
        
        switch sender{
            
        case backBtn:
            navigationController?.popViewController(animated: true)
            
        case addCategoryBtn:
            addFundType()
            
        case AddImg:
            addPhotoAndVideo()
            
        case currentLocationBtn:
            defaultPointSwitch.isOn == true ? clearData() :  getCurrentLocation()
           
 
            
        default: break
            
        }
    }
    
    @objc func switchButtonWasTapped(mySwitch: UISwitch){
        if defaultPointSwitch.isOn == true {
            clearData()
            cityTxt.isEnabled = false
            latitudetxt.isEnabled = false
            longitudeTxt.isEnabled = false

        }else{
            cityTxt.isEnabled = true
            latitudetxt.isEnabled = true
            longitudeTxt.isEnabled = true
        }
    }
    
    
    
    func addPhotoAndVideo(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker,animated: true)
    }
    
    func getCurrentLocation(){
        LocationManager.shared.getLocation { [self] location, error in
            let center = CLLocationCoordinate2DMake((location?.coordinate.latitude) ?? latitude , (location?.coordinate.longitude) ?? longitude)
            latitude=location?.coordinate.latitude ?? 0.0
            longitude=location?.coordinate.longitude ?? 0.0
            
            LocationManager.shared.getAddressFromLatLon(pdblLatitude: "\(self.latitude)", withLongitude: "\(self.longitude)") { status, mapaddress, mapcountry in
                
                self.cityTxt.text = mapcountry ?? ""
                self.latitudetxt.text="\(self.latitude)"
                self.longitudeTxt.text="\(self.longitude)"

            }
        }
    }
    

    

}

extension AddFundTypes{
    func addFundType(){
        do{
            let name = try pointName.validatedText(validationType: .requiredField(field: "Name required"))
            let maincategory = try mainCategoryTxt.validatedText(validationType: .requiredField(field: "main Category required"))
            let subcategory = try subCategoryTxt.validatedText(validationType: .requiredField(field: "sub Category required"))
            
            if defaultPointSwitch.isOn != true {
                let city = try cityTxt.validatedText(validationType: .requiredField(field: "City required"))
                let lat = try latitudetxt.validatedText(validationType: .requiredField(field: "latitude required"))
                let long = try longitudeTxt.validatedText(validationType: .requiredField(field: "longitude required"))
          
            }
            presenter.createFundType(name: name, main_category_id: "\(mainCategoryID)", sub_category_id: "\(subCategoryID)", latitude: latitudetxt.text ?? "", longitude: longitudeTxt.text ?? "", city: cityTxt.text ?? "", default_need: defaultPointSwitch.isOn == true ? "on" : "off" )
                presenter.delegate=self
                
         
       
        }catch{
            Alert.showErrorAlert(message: (error as! ValidationError).message)
            
        }
    }
    
    func clearData(){
        if defaultPointSwitch.isOn != true {
            mainCategoryTxt.text = ""
            subCategoryTxt.text = ""
            categoryImage.image = nil
            pointName.text = ""
        }
       
        latitudetxt.text = ""
        longitudeTxt.text = ""
        cityTxt.text = ""
 
    }
}


//MARK: - confirm to UIImagePicker Delegate

   extension AddFundTypes:UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return  }
        print(image)
        categoryImage.image = image
//        selectedImage=image.jpegData(compressionQuality: 0.5)
        
        
    }
}
extension AddFundTypes:UITextFieldDataPickerDelegate,UITextFieldDataPickerDataSource{
 
 
 func textFieldDataPicker(_ textField: UITextFieldDataPicker, numberOfRowsInComponent component: Int) -> Int {
      textField == mainCategoryTxt ? mainCategory.count : subCategory.count
     
 }
 
 func textFieldDataPicker(_ textField: UITextFieldDataPicker, titleForRow row: Int, forComponent component: Int) -> String? {

     textField == mainCategoryTxt ? mainCategory[row].name ?? "" : subCategory[row].name ?? ""
     
 }
 
 func numberOfComponents(in textField: UITextFieldDataPicker) -> Int {
     1
 }
 
 func textFieldDataPicker(_ textField: UITextFieldDataPicker, didSelectRow row: Int, inComponent component: Int) {
     if textField == mainCategoryTxt{
         mainCategoryID = mainCategory[row].id ?? 0
         mainCategoryTxt.setTextFieldTitle(title: mainCategory[row].name ?? "")
     }else{
         subCategoryID = subCategory[row].id ?? 0
         subCategoryTxt.setTextFieldTitle(title: subCategory[row].name ?? "")
     }

 }
 
 
}

extension AddFundTypes:MainDelegate{
    func showAlerts(title: String, message: String) {
        Alert.showSuccessAlert(message:message)
        clearData()
    }
    
    func getMainScreenData(data: MainScreenData) { }
    
    func getOpportunitiesData(data: ListOpportunities) {}
    
    func getStandardCategoriesFiltering(categories: MainHomeCategories) {
        mainCategory=categories.categories ?? []
        mainCategoryTxt.pickerDelegate=self
        mainCategoryTxt.dataSource=self
    }
    
    func getsubCategoriesFiltering(categories: SubHomeCategories) {
        subCategory=categories.categories ?? []
        subCategoryTxt.pickerDelegate=self
        subCategoryTxt.dataSource=self
    }
    
    
  
    
}

