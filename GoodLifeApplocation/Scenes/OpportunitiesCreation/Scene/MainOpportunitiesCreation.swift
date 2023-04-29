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
    var socialChannelSelected:[String]=[]
    var topAdvertisingSelected:[String]=[]
    var commomWaysWorship:[String]=[]
    var litrugicalMarketGraph:[String:String]=[:]
    var businessplan:[String:String]=[:]
    var marketGraph:[String:String]=[:]
    var id = 0
    var stepNumber = 0
    var vc:UIViewController?
    let presenter=OpportunitiesPresenter()
    let prefixToRemove = "$"
    var intrest = 0
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
            categoriesSelected = (vc as! GeneralOpportunitiesCreation).categoriesIdSelection
            amountRaise = (vc as! GeneralOpportunitiesCreation).amountraiseTxt.text ?? ""
            intrest=(vc as! GeneralOpportunitiesCreation).intrestSelection.selectedSegmentIndex+1
            print(amountOfTechnology)
            print(levelOfDifficulty)

            if categoriesSelected.count != 0 {
                print(categoriesSelected)
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
            avgAnnualRevenu = (vc as! FinancialOpportunitiesCreation).AverageAnnualRevenuTxt.text ?? "".replacingOccurrences(of: prefixToRemove, with: "")
            avgMonthlyCost = (vc as! FinancialOpportunitiesCreation).avaregeMonthlyCost.text ?? "".replacingOccurrences(of: prefixToRemove, with: "")
            
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
            
            topAdvertisingSelected = (vc as! MarketingOpportunitiesCreation).topAdvertisingSelected
            socialChannelSelected = (vc as! MarketingOpportunitiesCreation).socialChannelSelected
            marketGraph=(vc as! MarketingOpportunitiesCreation).marketGraph
            
            if !marketGraph.isEmpty {
                
                if topAdvertisingSelected.count != 0 {
                    if socialChannelSelected.count != 0 {
                        
                        self.stepNumber=4
                        self.containerview.subviews.first?.removeFromSuperview()
                        self.stepperView.currentStep = 3
                        vc=LiturgicalOpportunitiesCreation()
                        
                        self.addChild(vc!)
                        self.containerview.addSubview(vc!.view)
                        vc!.didMove(toParent: self)
                        vc!.view.frame = self.containerview.bounds
                        
                    }else{
                        showSnackBar(message: "Select recommended social channel")
                    }
                }else{
                    showSnackBar(message: "Select top advertising channel")
                }
                
            }else{
                showSnackBar(message: "Add your market size")
            }
            
            
        case 4:
            
            
            
            commomWaysWorship = (vc as! LiturgicalOpportunitiesCreation).commomWaysWorship
            
            litrugicalMarketGraph=(vc as! LiturgicalOpportunitiesCreation).marketGraph
            
            if commomWaysWorship.count != 0 {
                if !litrugicalMarketGraph.isEmpty {
                    
                    self.stepNumber=5
                    
                    self.containerview.subviews.first?.removeFromSuperview()
                    
                    self.stepperView.currentStep = 4
                    vc=DigitalOpportunitiesCreation()
                    
                    self.addChild(vc!)
                    self.containerview.addSubview(vc!.view)
                    vc!.didMove(toParent: self)
                    vc!.view.frame = self.containerview.bounds
                }else{
                    showSnackBar(message: "Add your Market Size")
                    
                }
            }else{
                showSnackBar(message: "Add Common ways to worship ")
            }
            
            
            
        case 5:
            opportunitiesUrl = "https://" + ((vc as! DigitalOpportunitiesCreation).opportunitiesUrl.text ?? "")
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
            
        case 6:
            print(businessplan)

            businessplan = (vc as! BusinessPlanOpportunitiesCreation).businessplan
            
            businessplan.merge(marketGraph){(_, new) in new}
            businessplan.merge(litrugicalMarketGraph){(_, new) in new}
            print(businessplan)
            if !businessplan.isEmpty {
                print(categoriesSelected)
                presenter.completeOpportunity(interest:"\(intrest)",id: id, financialModel: financialModelData, workType: timeOfCommitment.lowercased(), levelOfDifficulty: levelOfDifficulty.lowercased(), AmountOfTechnology: amountOfTechnology.lowercased(), amountRasise: amountRaise.replacingOccurrences(of: prefixToRemove, with: ""), opportuntiesUrl: opportunitiesUrl, competitorsUrl: competitorsUrl, commomWays: commomWaysWorship, topAdvertisingChannel: topAdvertisingSelected, socialChannels: socialChannelSelected, avgAnnualRevenu: avgAnnualRevenu.replacingOccurrences(of: prefixToRemove, with: ""), avgMonthlyCost: avgMonthlyCost.replacingOccurrences(of: prefixToRemove, with: ""), categories:categoriesSelected ,marketGraph:businessplan)
                presenter.delegate=self
            
                
            }else{
                showSnackBar(message: "Add your Business plan")
                
            }
            
        default:
            print("test")
            
        }
    }
}


extension MainOpportunitiesCreation:OpportunitiesDelegate {
    func opportunitiesDetails(data: opportunitiesData) {
        
    }
    
    func showAlerts(title: String, message: String) {
        navigationController?.popViewController(animated: true)

    }
    
    func getFundTypeData(data: FundType) {}
    
    func getChannels(data: RecommendedChannel) {}
    
    
}
