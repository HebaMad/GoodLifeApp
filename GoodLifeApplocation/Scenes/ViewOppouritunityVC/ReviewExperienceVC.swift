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
    
    @IBOutlet weak var categoryTableHeight: NSLayoutConstraint!
    @IBOutlet weak var categoryRateTable: UITableView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var categoryTxt: UITextFieldDataPicker!
    
    
    //MARK: - Properties
    var presenter = MenuPresenter()
    var selectedImage:Data?
    var oppourtinity:[opportunitiesData] = []
    var categoryPresenter = HomePresenter()
    var itemID:Int=0
    var fundType:[fund_typess]=[]
    var parameter:[String:String]=[:]
    var categoryID:[String]=[]
    var categoriesRating:[String]=[]
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTxt.isEnabled = false
        categoryPresenter.AllOpportunities()
        categoryPresenter.delegate = self
        bindBackButton()
        categoryRateSetupTable()
   
    }
    
    func categoryRateSetupTable(){
        categoryRateTable.register(CategoryReviews.self)
        categoryRateTable.delegate=self
        categoryRateTable.dataSource=self
        
    }
}
//MARK: - Binding

private extension ReviewExperienceVC{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
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
        makeParameter(key: categoryID, value: categoriesRating)
        do{
            
            let title = try categoryTxt.validatedText(validationType: .requiredField(field: "category required"))
           
            if projectReview.text.isEmpty != true{
                
                if parameter.keys.count == fundType.count{
                    print(parameter)
                    presenter.createFeedback(id: "\(self.itemID)", review:projectReview.text , ratings: parameter)
                    presenter.delegate=self
                    
                }else{
                    Alert.showErrorAlert(message: "please review All categories connected with opportunities")

                }
               
                
            }else{
                Alert.showErrorAlert(message: "Review text required ")
                
            }
       
        }catch{
            Alert.showErrorAlert(message: (error as! ValidationError).message)
            
        }
    }
    
    
}

//MARK: - Confirm to Menu Delegate


extension ReviewExperienceVC:MenuDelegate{
    func getCategories(data: FundTyps) {
        fundType=data.fund_types ?? []
        
        print(fundType)
        self.categoryTableHeight.constant=CGFloat(40*fundType.count)

        categoryRateTable.reloadData()
        
    }
    
    func getMyResource(data: StewardingMyResource) {}
    
    func getFundTypeData(data: FundType) {}
    
    
    func showAlerts(title: String, message: String) {
        Alert.showSuccessAlert(message:message)
        clearData()
        
    }
    func getFunderData(data: WorthyCauses) { }
}


extension ReviewExperienceVC : HomeDelegate {
    func getOpportunitiesFiltering(Opportunities: Opportuntiesss) {
        self.oppourtinity = Opportunities.opportunities ?? []
        print(self.oppourtinity)

        categoryTxt.isEnabled = true

        categoryTxt.pickerDelegate=self
        categoryTxt.dataSource=self
    }
    
    func getCategoriesFiltered(categories: Home) { }
    
    func getMainScreenData(data: MainScreenData) { }
    
    func getOppourtinityDetails(categories: OppourtinityDetails) {}

    
}

    extension ReviewExperienceVC {
        
    func clearData() {
        categoryTxt.text = ""
        projectReview.text = ""
        categoryRateTable.reloadData()

    }
        
}

   extension ReviewExperienceVC:UITextFieldDataPickerDelegate,UITextFieldDataPickerDataSource{
    
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, numberOfRowsInComponent component: Int) -> Int {
        oppourtinity.count
    }
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, titleForRow row: Int, forComponent component: Int) -> String? {
        print("\(title ?? "")")
        return " " + (oppourtinity[row].name ?? "")
    }
    
    func numberOfComponents(in textField: UITextFieldDataPicker) -> Int {
        1
    }
    
    func textFieldDataPicker(_ textField: UITextFieldDataPicker, didSelectRow row: Int, inComponent component: Int) {
        print(self.oppourtinity)

        categoryTxt.setTextFieldTitle(title: " " + (oppourtinity[row].name ?? ""))
        self.itemID=oppourtinity[row].id ?? 0
        presenter.getCategories(opportunitiyID: "\(self.itemID)")
        presenter.delegate=self
    }
 
}


extension ReviewExperienceVC:UITableViewDelegate{}
extension ReviewExperienceVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fundType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CategoryReviews = tableView.dequeueReusableCell(for: indexPath)
        cell.categoryName.text = fundType[indexPath.row].name ?? ""
        categoryID.append("\(fundType[indexPath.row].id ?? 0)")
        cell.categoryRate.delegate = self



        return cell
    }
    
    
}

extension ReviewExperienceVC:RatingControlDelegate{
    func categoryReviewsDidChangeRating(_ ratingControl: RatingControl, rating: Int) {
        categoriesRating.append("\(rating)")
    }
    
    
}




extension ReviewExperienceVC{
    func makeParameter(key:[String],value:[String]){
        parameter=[:]

        if key.count == value.count{
            for indx in 0 ..< key.count{
                parameter["ratings[\(key[indx])][value]"]=value[indx]

            }
        }else{
            Alert.showErrorAlert(message: "please review All categories connected with opportunity")

        }

     
        
    }
    
    @objc func categoryRateDidChange(_ ratingControl: RatingControl) {
        // Handle the rating change event here
        let rating = ratingControl.rating
        print("Rating changed to \(rating)")
    }
}
