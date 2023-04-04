//
//  GeneralOpportunitiesCreation.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/03/2023.
//

import UIKit
import DropDown
class GeneralOpportunitiesCreation: UIViewController {
    
    @IBOutlet weak var timeCommitmentTxt: UITextField!
    @IBOutlet weak var timeCommitmentBtn: UIButton!
    
    @IBOutlet weak var LevelOfDifficultyBtn: UIButton!
    @IBOutlet weak var LevelOfDifficultyTxt: UITextField!
    
    @IBOutlet weak var AmountOfTechnologyBtn: UIButton!
    @IBOutlet weak var AmountOfTechnologyTxt: UITextField!
    
    @IBOutlet weak var categoriesTxt: UITextField!
    @IBOutlet weak var categoriesBtn: UIButton!
    
    //MARK: - Properties
    
    let dropDown = DropDown()
    
    let levelOfDifficulty:[String] = ["Easy","Medium","Hard"]
    let timeCommitment:[String] = ["Daily","Weekly","BiWeekly"]
    let AmountOfTechnology:[String] = ["Minimal","Maximal"]
    let presenter=OpportunitiesPresenter()
    var categories:[String]=[]
    var categoriesSelected:[String]=[]
    var allCategories = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCategories()
        
    }
    
    
    func getCategories(){
        presenter.getFundType()
        presenter.delegate=self
    }
    
    
    @IBAction func categoryBtn(_ sender: Any) {
        
        self.dropDown.anchorView = self.categoriesBtn
        self.dropDown.dataSource = self.categories
        self.dropDown.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
        
        self.dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        }
        self.dropDown.multiSelectionAction = { [self] (index: [Int], item: [String]) in
            print("Selected item: \(item) at index: \(index)")
            
            self.categoriesTxt.textColor = UIColor.black
            
            for i in 0 ... item.count-1{
                categoriesSelected.append(item[i])
                allCategories += ",\(item[i])"
            }
        }
            print(categoriesSelected)
      
            self.dropDown.width = self.categoriesTxt.frame.size.width
            self.dropDown.bottomOffset = CGPoint(x: 0, y:(self.dropDown.anchorView?.plainView.bounds.height)!)
            self.dropDown.show()
            
       
    }
    
    @IBAction func difficuiltyBtn(_ sender: Any) {
        
        self.dropDown.anchorView = self.LevelOfDifficultyBtn
        self.dropDown.dataSource = self.levelOfDifficulty
        self.dropDown.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
        
        self.dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        }
        self.dropDown.selectionAction = { [self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.LevelOfDifficultyTxt.text = item
            
            self.LevelOfDifficultyTxt.textColor = UIColor.black
            
        }
        self.dropDown.width = self.LevelOfDifficultyTxt.frame.size.width
        self.dropDown.bottomOffset = CGPoint(x: 0, y:(self.dropDown.anchorView?.plainView.bounds.height)!)
        self.dropDown.show()
        
    }
    @IBAction func timeOfCommitmentBtn(_ sender: Any) {
        
        self.dropDown.anchorView = self.timeCommitmentBtn
        self.dropDown.dataSource = self.timeCommitment
        self.dropDown.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
        
        self.dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        }
        self.dropDown.selectionAction = { [self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.timeCommitmentTxt.text = item
            
            self.timeCommitmentTxt.textColor = UIColor.black
            
        }
        self.dropDown.width = self.timeCommitmentTxt.frame.size.width
        self.dropDown.bottomOffset = CGPoint(x: 0, y:(self.dropDown.anchorView?.plainView.bounds.height)!)
        self.dropDown.show()
        
    }
    
    @IBAction func TechnologyBtn(_ sender: Any) {
        
        self.dropDown.anchorView = self.AmountOfTechnologyBtn
        self.dropDown.dataSource = self.AmountOfTechnology
        self.dropDown.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
        
        self.dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        }
        self.dropDown.selectionAction = { [self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.AmountOfTechnologyTxt.text = item
            self.AmountOfTechnologyTxt.textColor = UIColor.black
            
        }
        self.dropDown.width = self.AmountOfTechnologyTxt.frame.size.width
        self.dropDown.bottomOffset = CGPoint(x: 0, y:(self.dropDown.anchorView?.plainView.bounds.height)!)
        self.dropDown.show()
        
    }
    
}
extension GeneralOpportunitiesCreation:OpportunitiesDelegate{
    func showAlerts(title: String, message: String) {}
    
    func getFundTypeData(data: FundType) {
        
        getName(data: data.fund_types ?? [])
        
    }
}


extension GeneralOpportunitiesCreation {
    
    func getName(data:[mainType]){
        for index in 0 ..< data.count{
            categories.append(data[index].name ?? "")
        }
    }
    
}
