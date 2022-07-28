//
//  OnBoardingVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit

class OnBoardingVC: UIViewController {
    
    @IBOutlet weak var stepsIndicator: StepIndicatorView!
    
    @IBOutlet weak var continueAction: UIButtonDesignable!
    @IBOutlet weak var contsinerView: UIView!
    @IBOutlet weak var skipAction: UIButton!
    var onBoardingScreen = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        checkStatus()

    }


    @IBAction func continueBtn(_ sender: Any) {
        checkStatus()
    }
    func checkStatus(){
        switch self.onBoardingScreen{

        case 0:
            stepsIndicator.currentStep = 0
            let vc=OnBoardingFrame2()
            self.addChild(vc)
            self.contsinerView.addSubview(vc.view)
            self.onBoardingScreen=1
        case 1:
            stepsIndicator.currentStep = 1

            let vc=OnBoardingFrame3()
            self.addChild(vc)
            self.contsinerView.addSubview(vc.view)
            self.onBoardingScreen=2
        case 2:
            stepsIndicator.currentStep = 2

            let vc=OnBoardingFrame4()
            self.addChild(vc)
            self.contsinerView.addSubview(vc.view)
            self.onBoardingScreen=3
        case 3:
            stepsIndicator.currentStep = 3

            let vc=OnBoardingFrame5()
            self.addChild(vc)
//            skipAction.isEnabled = false
//            skipAction.setTitleColor(.clear, for: .normal)
            skipAction.setTitleColor(.clear, for: .normal)
            continueAction.setTitle("Welcome!", for: .normal)
            self.contsinerView.addSubview(vc.view)
            self.onBoardingScreen=4

        default:
  print("test")
        }
    }

}
