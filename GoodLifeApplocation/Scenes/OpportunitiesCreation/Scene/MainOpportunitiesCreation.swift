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
            self.stepNumber=2
            
            self.containerview.subviews.first?.removeFromSuperview()
            
            self.stepperView.currentStep = 1
            vc=FinancialOpportunitiesCreation()
            
            self.addChild(vc!)
            self.containerview.addSubview(vc!.view)
            vc!.didMove(toParent: self)
            vc!.view.frame = self.containerview.bounds
            
            
        case 2:
            self.stepNumber=3
            
            self.containerview.subviews.first?.removeFromSuperview()
            
            self.stepperView.currentStep = 2
            vc=MarketingOpportunitiesCreation()
            
            self.addChild(vc!)
            self.containerview.addSubview(vc!.view)
            vc!.didMove(toParent: self)
            vc!.view.frame = self.containerview.bounds
            
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
            self.stepNumber=6
            
            self.containerview.subviews.first?.removeFromSuperview()
            
            self.stepperView.currentStep = 5
            vc=BusinessPlanOpportunitiesCreation()
            
            self.addChild(vc!)
            self.containerview.addSubview(vc!.view)
            vc!.didMove(toParent: self)
            vc!.view.frame = self.containerview.bounds
            
        default:
            print("test")
            
        }
    }
}
