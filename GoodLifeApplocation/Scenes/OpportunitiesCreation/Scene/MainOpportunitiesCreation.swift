//
//  MainOpportunitiesCreation.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/03/2023.
//

import UIKit

class MainOpportunitiesCreation: UIViewController {
    
    @IBOutlet weak var stepperView: StepIndicatorView!
    
    @IBOutlet weak var containerview: UIView!
    
    var financialModelData:[String]=[]
    var levelOfDifficulty=""
    var timeOfCommitment=""
    var amountOfTechnology=""
    var amountRaise = ""
    var avgAnnualRevenu = ""
    var avgMonthlyCost = ""
    var opportunitiesUrl = ""
    var competitorsUrl:[String]=[]
    
    var categoriesSelected:[String]=[]
    var stepNumber = 0
    var vc:UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepNumber = 0
        checkstepNumber()
        
    }
    @IBAction func continueBtn(_ sender: Any) {
        
        checkstepNumber()
        
    }
    
    
    @IBAction func backBtn(_ sender: Any){
        navigationController?.popViewController(animated: true)
    }
    
}

extension MainOpportunitiesCreation{
    func checkstepNumber(){
        
        switch self.stepNumber{
            
        case 0:
            self.stepNumber=1
            
            self.containerview.subviews.first?.removeFromSuperview()
            
            self.stepperView.currentStep = 0
            vc=GeneralOpportunitiesCreation()
            
            self.addChild(vc!)
            self.containerview.addSubview(vc!.view)
            vc!.didMove(toParent: self)
            vc!.view.frame = self.containerview.bounds
            
            
        case 1:
            
            financialModelData = (vc as! GeneralOpportunitiesCreation).financialModelData
            levelOfDifficulty =  (vc as! GeneralOpportunitiesCreation).LevelOfDifficultyTxt.text ?? ""
            timeOfCommitment =   (vc as! GeneralOpportunitiesCreation).timeCommitmentTxt.text ?? ""
            amountOfTechnology = (vc as! GeneralOpportunitiesCreation).AmountOfTechnologyTxt.text ?? ""
            categoriesSelected = (vc as! GeneralOpportunitiesCreation).categoriesSelected
            amountRaise = (vc as! GeneralOpportunitiesCreation).amountraiseTxt.text ?? ""
            
            if categoriesSelected.count != 0 {
                
                if financialModelData.count != 0 {
                    
                    if timeOfCommitment != "" {
                        
                        if levelOfDifficulty != "" {
                            
                            if amountOfTechnology != "" {
                                
                                if amountRaise != "" {
                                    self.stepNumber=2
                                    
                                    self.containerview.subviews.first?.removeFromSuperview()
                                    
                                    self.stepperView.currentStep = 1
                                    vc=FinancialOpportunitiesCreation()
                                    
                                    self.addChild(vc!)
                                    self.containerview.addSubview(vc!.view)
                                    vc!.didMove(toParent: self)
                                    vc!.view.frame = self.containerview.bounds
                                }else{
                                    showSnackBar(message: "Add your amount raise")
                                    
                                }
                            }else{
                                showSnackBar(message: "Select your amount of technology")
                            }
                            
                        }else{
                            showSnackBar(message: "Select your level of Difficuilty")
                        }
                        
                    }else{
                        showSnackBar(message: "Select your time of commitment")
                        
                    }
                }else{
                    showSnackBar(message: "Add your financial Model")
                    
                }
            }else{
                showSnackBar(message: "Select your Categories")
            }
            
            
            
            
            
            
        case 2:
            avgAnnualRevenu = (vc as! FinancialOpportunitiesCreation).AverageAnnualRevenuTxt.text ?? ""
            avgMonthlyCost = (vc as! FinancialOpportunitiesCreation).avaregeMonthlyCost.text ?? ""
            
            if avgAnnualRevenu != "" && avgAnnualRevenu != "$" {
                if avgMonthlyCost != "" && avgMonthlyCost != "$" {
                    
                    
                    self.stepNumber=3
                    
                    self.containerview.subviews.first?.removeFromSuperview()
                    
                    self.stepperView.currentStep = 2
                    vc=MarketingOpportunitiesCreation()
                    
                    self.addChild(vc!)
                    self.containerview.addSubview(vc!.view)
                    vc!.didMove(toParent: self)
                    vc!.view.frame = self.containerview.bounds
                    
                }else{
                    showSnackBar(message: "Add your Avarege monthly cost")
                    
                }
            }else{
                showSnackBar(message: "Add your Avarege Annual Revenu")
            }
            
            
        case 3:
            self.stepNumber=4
            
            self.containerview.subviews.first?.removeFromSuperview()
            
            self.stepperView.currentStep = 3
            vc=LiturgicalOpportunitiesCreation()
            
            self.addChild(vc!)
            self.containerview.addSubview(vc!.view)
            vc!.didMove(toParent: self)
            vc!.view.frame = self.containerview.bounds
            
        case 4:
            self.stepNumber=5
            
            self.containerview.subviews.first?.removeFromSuperview()
            
            self.stepperView.currentStep = 4
            vc=DigitalOpportunitiesCreation()
            
            self.addChild(vc!)
            self.containerview.addSubview(vc!.view)
            vc!.didMove(toParent: self)
            vc!.view.frame = self.containerview.bounds
        case 5:
            opportunitiesUrl = (vc as! DigitalOpportunitiesCreation).opportunitiesUrl.text ?? ""
            competitorsUrl = (vc as! DigitalOpportunitiesCreation).competitorsUrl
            
            if opportunitiesUrl != "" {
                if competitorsUrl.count != 0 {
                    
                    self.stepNumber=6
                    
                    self.containerview.subviews.first?.removeFromSuperview()
                    
                    self.stepperView.currentStep = 5
                    vc=BusinessPlanOpportunitiesCreation()
                    
                    self.addChild(vc!)
                    self.containerview.addSubview(vc!.view)
                    vc!.didMove(toParent: self)
                    vc!.view.frame = self.containerview.bounds
                    
                    
                }else{
                    showSnackBar(message: "Add your Competitors Url")
                    
                }
                
            }else{
                showSnackBar(message: "Add your Avarege Monthly cost")
                
            }
            
            
        default:
            print("test")
            
        }
    }
}
