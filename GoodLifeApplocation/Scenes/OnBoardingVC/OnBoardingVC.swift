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
            self.contsinerView.subviews.first?.removeFromSuperview()

            stepsIndicator.currentStep = 0
            let vc=OnBoardingFrame1()
            self.addChild(vc)
            self.contsinerView.addSubview(vc.view)
            self.onBoardingScreen=1
            vc.didMove(toParent: self)
            vc.view.frame = contsinerView.bounds
        case 1:
            self.contsinerView.subviews.first?.removeFromSuperview()

            stepsIndicator.currentStep = 1
            let vc=VerificationVC()
            self.addChild(vc)
            self.contsinerView.addSubview(vc.view)
            self.onBoardingScreen=2
            vc.didMove(toParent: self)
            vc.view.frame = contsinerView.bounds
        case 2:
            self.contsinerView.subviews.first?.removeFromSuperview()

            stepsIndicator.currentStep = 2

            let vc=OnBoardingFrame2()
            self.addChild(vc)
            self.contsinerView.addSubview(vc.view)
            self.onBoardingScreen=3
            vc.didMove(toParent: self)
            vc.view.frame = contsinerView.bounds
        case 3:
            self.contsinerView.subviews.first?.removeFromSuperview()

            stepsIndicator.currentStep = 3

            let vc=OnBoardingFrame3()
            self.addChild(vc)
            self.contsinerView.addSubview(vc.view)
            self.onBoardingScreen=4
            vc.didMove(toParent: self)
            vc.view.frame = contsinerView.bounds
            
        case 4:
            self.contsinerView.subviews.first?.removeFromSuperview()

            stepsIndicator.currentStep = 4

            let vc=OnBoardingFrame4()
            self.addChild(vc)
            self.contsinerView.addSubview(vc.view)
            self.onBoardingScreen=5
            vc.didMove(toParent: self)
            vc.view.frame = contsinerView.bounds
        case 5:
            self.contsinerView.subviews.first?.removeFromSuperview()

            stepsIndicator.currentStep = 5

            let vc=OnBoardingFrame5()
            self.addChild(vc)
            skipAction.isEnabled = false
            skipAction.titleLabel?.textColor = .clear
//            skipAction.setTitleColor(.clear, for: .normal)
            continueAction.setTitle("Welcome!", for: .normal)
            self.contsinerView.addSubview(vc.view)
            self.onBoardingScreen=6

        default:
  print("test")
        }
    }

}
