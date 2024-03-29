//
//  FilterVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/07/2022.
//

import UIKit
import DropDown
import RangeSeekSlider

class FilterVC: UIViewController {
    
    //MARK: - Outlet

    @IBOutlet var myView: UIView!
    @IBOutlet weak var timeCommitmentTxt: UITextField!
    @IBOutlet weak var timeCommitmentBtn: UIButton!
    
    @IBOutlet weak var LevelOfDifficultyBtn: UIButton!
    @IBOutlet weak var LevelOfDifficultyTxt: UITextField!
    
    @IBOutlet weak var AmountOfTechnologyBtn: UIButton!
    @IBOutlet weak var AmountOfTechnologyTxt: UITextField!
    
    @IBOutlet weak var investmentAmountTxt: UILabel!
    @IBOutlet weak var priceSlidering: RangeSeekSlider!

    
    //MARK: - Properties
    
    let dropDown = DropDown()

    let levelOfDifficulty:[String] = ["Easy","Medium","Hard"]
    let timeCommitment:[String] = ["Daily","Weekly","BiWeekly"]
    let AmountOfTechnology:[String] = ["Minimal","Maximal"]
    var minInvestmentValue:Float = 0.0
    var maxInvestmentValue:Float = 0.0
    let presenter = HomePresenter()
    var onFilterDissmissed : DataFiltered?
    var tapGesture = UITapGestureRecognizer()
    
    //MARK: - Life CYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRangeSlider()
        setupTapGesture()
    }
    
    
    //MARK: - Setup Tap Gesture Recognizer

    func setupTapGesture(){
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        myView.addGestureRecognizer(tapGesture)
        myView.isUserInteractionEnabled = true
       }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true)
    }
    //MARK: - Setup RangeSlider

    func setupRangeSlider(){
    priceSlidering.numberFormatter.locale = Locale(identifier: "en_US")
    priceSlidering.numberFormatter.positivePrefix = "$"
    priceSlidering.numberFormatter.positiveSuffix = "k"
    priceSlidering.delegate = self
    }
    @IBAction func filterBtn(_ sender: UIButtonDesignable) {
        filterData()
    }
    
     
    //MARK: - Private Handler
 
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

extension FilterVC {
    
    func filterData(){
        
        do{
                let AmountOfTechnology = try AmountOfTechnologyTxt.validatedText(validationType: .requiredField(field: "Select Amount Of Technology options"))
                let LevelOfDifficulty = try LevelOfDifficultyTxt.validatedText(validationType: .requiredField(field: "Select monthly revenu options"))
                let timeCommitment = try timeCommitmentTxt.validatedText(validationType: .requiredField(field: "Select time of commitment options"))
            
            presenter.opportunityFiltering(invest_from:"\(minInvestmentValue*1000)",invest_to: "\(maxInvestmentValue*1000)" , time_commitment: timeCommitment.lowercased(), level_of_difficulty: LevelOfDifficulty.lowercased(), amount_of_technology: AmountOfTechnology.lowercased())

                presenter.delegate=self
              
        }catch{
            showSnackBar(message: (error as! ValidationError).message)

//            self.showAlert(title: "Warning", message: (error as! ValidationError).message,hideCancelBtn: true)
       
        }
    }
}

extension FilterVC:HomeDelegate{
    func getOpportunitiesFiltering(Opportunities: Opportuntiesss) {
        self.dismiss(animated: true) {
            if let _delegate = self.onFilterDissmissed {
                _delegate.filteredData(data: Opportunities.opportunities ?? [])
            }
        }
        
    }
    

    
    func showAlerts(title: String, message: String) {}
    
    func getOpportunities(categories: Opportuntiesss) {}
    
    func getCategoriesFiltered(categories: Home) {}
    
    func getOppourtinityDetails(categories: OppourtinityDetails) {}
    
    func getMainScreenData(data: MainScreenData) {}
    

    

    func getOppourtinity(categories: Oppourtinity) {

    }
}

extension FilterVC:RangeSeekSliderDelegate{
 func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
     investmentAmountTxt.text = "\(Int(minInvestmentValue))" + " " + "k" + "-" + "\(Int(maxInvestmentValue))" + " " + "k"

     minInvestmentValue=Float(minValue)
     maxInvestmentValue=Float(maxValue)

 }
}
