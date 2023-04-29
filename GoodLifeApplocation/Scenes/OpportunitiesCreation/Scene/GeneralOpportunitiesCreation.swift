//
//  GeneralOpportunitiesCreation.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/03/2023.
//

import UIKit
import DropDown
class GeneralOpportunitiesCreation: UIViewController {
    
    @IBOutlet weak var amountraiseTxt: UITextField!
    @IBOutlet weak var timeCommitmentTxt: UITextField!
    @IBOutlet weak var timeCommitmentBtn: UIButton!
    
    @IBOutlet weak var LevelOfDifficultyBtn: UIButton!
    @IBOutlet weak var LevelOfDifficultyTxt: UITextField!
    
    @IBOutlet weak var AmountOfTechnologyBtn: UIButton!
    @IBOutlet weak var AmountOfTechnologyTxt: UITextField!
    
    @IBOutlet weak var categoriesTxt: UITextField!
    @IBOutlet weak var categoriesBtn: UIButton!
    
    @IBOutlet weak var intrestSelection: UISegmentedControl!
    @IBOutlet weak var financialModelTxt: UITextField!
    //MARK: - Properties
    
    let dropdown = DropDown()
    let categoryActionDropdown = DropDown()

    let levelOfDifficulty:[String] = ["Easy","Medium","Hard"]
    let timeCommitment:[String] = ["Daily","Weekly","BiWeekly"]
    let AmountOfTechnology:[String] = ["Minimal","Maximal"]
    let presenter=OpportunitiesPresenter()
    var categories:[String]=[]
    var categoriesSelected:[String]=[]
    var allCategories = ""
    var financialModelData:[String]=[]
    var categoriesIdSelection:[String]=[]
    var categoriesId:[String]=[]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCategories()
        intrestSelection.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)], for: .normal)
    }
    
    
    func getCategories(){
        
        presenter.getFundType()
        presenter.delegate=self
        
    }
    

    @IBAction func addMoreFinancialModel(_ sender: Any) {
        if financialModelTxt.text != ""{
            financialModelData.append(financialModelTxt.text!)
            financialModelTxt.text=""
        }else{
            Alert.showErrorAlert(message: "Add your Financial Model ")
        }
    }
    

    
    @IBAction func difficuiltyBtn(_ sender: Any) {
        
        self.dropdown.anchorView = self.LevelOfDifficultyBtn
        self.dropdown.dataSource = self.levelOfDifficulty
        self.dropdown.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
        
        self.dropdown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        }
        self.dropdown.selectionAction = { [self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.LevelOfDifficultyTxt.text = item
            
            self.LevelOfDifficultyTxt.textColor = UIColor.black
            
        }
        self.dropdown.width = self.LevelOfDifficultyTxt.frame.size.width
        self.dropdown.bottomOffset = CGPoint(x: 0, y:(self.dropdown.anchorView?.plainView.bounds.height)!)
        self.dropdown.show()
        
    }
    @IBAction func timeOfCommitmentBtn(_ sender: Any) {
        
        self.dropdown.anchorView = self.timeCommitmentBtn
        self.dropdown.dataSource = self.timeCommitment
        self.dropdown.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
        
        self.dropdown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        }
        self.dropdown.selectionAction = { [self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.timeCommitmentTxt.text = item
            
            self.timeCommitmentTxt.textColor = UIColor.black
            
        }
        self.dropdown.width = self.timeCommitmentTxt.frame.size.width
        self.dropdown.bottomOffset = CGPoint(x: 0, y:(self.dropdown.anchorView?.plainView.bounds.height)!)
        self.dropdown.show()
        
    }
    
    @IBAction func TechnologyBtn(_ sender: Any) {
        
        self.dropdown.anchorView = self.AmountOfTechnologyBtn
        self.dropdown.dataSource = self.AmountOfTechnology
        self.dropdown.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
        
        self.dropdown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        }
        self.dropdown.selectionAction = { [self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.AmountOfTechnologyTxt.text = item
            self.AmountOfTechnologyTxt.textColor = UIColor.black
            
        }
        self.dropdown.width = self.AmountOfTechnologyTxt.frame.size.width
        self.dropdown.bottomOffset = CGPoint(x: 0, y:(self.dropdown.anchorView?.plainView.bounds.height)!)
        self.dropdown.show()
        
    }
    
    
    @IBAction func categoryAction(_ sender: Any) {
    
        
        self.categoryActionDropdown.anchorView = self.categoriesBtn
        self.categoryActionDropdown.dataSource = self.categories
        self.categoryActionDropdown.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
        
        self.categoryActionDropdown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        }
        
        self.categoryActionDropdown.multiSelectionAction = { [self] (index: [Int], item: [String]) in
            print("Selected item: \(item) at index: \(index)")
            self.categoriesTxt.textColor = UIColor.black
            categoriesSelection(selectionId: index.map { String($0) })
            categoriesSelected = item
            let selectedCategories = categoriesSelected.joined(separator: ",")
            self.categoriesTxt.text = selectedCategories
            
            
        }
        
        self.categoryActionDropdown.width = self.categoriesTxt.frame.size.width
        self.categoryActionDropdown.bottomOffset = CGPoint(x: 0, y:(self.categoryActionDropdown.anchorView?.plainView.bounds.height)!)
        self.categoryActionDropdown.show()
        
        
    }
    
    
}
extension GeneralOpportunitiesCreation:OpportunitiesDelegate{
    func opportunitiesDetails(data: opportunitiesData) {
        
    }
    
    func getChannels(data: RecommendedChannel) {
        
    }
    
    func showAlerts(title: String, message: String) {}
    
    func getFundTypeData(data: FundType) {
        
        getName(data: data.fund_types ?? [])
        
        
        
    }
}


extension GeneralOpportunitiesCreation {
    
    func getName(data:[mainType]){
        categoriesId=[]
        for index in 0 ..< data.count{
            categories.append(data[index].name ?? "")
            categoriesId.append("\(data[index].id ?? 0)")
        }
    }
    
    func categoriesSelection(selectionId:[String]){
        categoriesIdSelection=[]
        for indx in 0 ..< categoriesId.count{
            categoriesIdSelection.append(categoriesId[indx])
        }
    }
    
}

