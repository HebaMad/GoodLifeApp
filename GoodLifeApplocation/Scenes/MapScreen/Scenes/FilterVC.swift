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
    let timeCommitment:[String] = ["Daily","Weekly","Bi_weekly"]
    let AmountOfTechnology:[String] = ["Minimal","Maximal"]
    var minInvestmentValue:Float = 0.0
    var maxInvestmentValue:Float = 0.0
    
    //MARK: - Life CYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRangeSlider()
    }
    
    //MARK: - Setup RangeSlider
     func setupRangeSlider(){
     priceSlidering.numberFormatter.positivePrefix = "$"
     priceSlidering.numberFormatter.positiveSuffix = "k"
     priceSlidering.delegate = self
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
            self.LevelOfDifficultyTxt.text = item.lowercased()

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
            self.timeCommitmentTxt.text = item.lowercased()

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
            self.AmountOfTechnologyTxt.text = item.lowercased()
            self.AmountOfTechnologyTxt.textColor = UIColor.black
            
        }
        self.dropDown.width = self.AmountOfTechnologyTxt.frame.size.width
        self.dropDown.bottomOffset = CGPoint(x: 0, y:(self.dropDown.anchorView?.plainView.bounds.height)!)
        self.dropDown.show()
        
    }
}

 

extension FilterVC:RangeSeekSliderDelegate{
 func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
     minInvestmentValue=Float(minValue)
     maxInvestmentValue=Float(maxValue)

 }
}
