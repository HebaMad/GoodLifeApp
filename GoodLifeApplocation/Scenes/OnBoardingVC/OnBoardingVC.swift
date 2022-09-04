//
//  OnBoardingVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit

class OnBoardingVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var stepsIndicator: StepIndicatorView!
    @IBOutlet weak var continueAction: UIButtonDesignable!
    @IBOutlet weak var contsinerView: UIView!
    @IBOutlet weak var skipAction: UIButton!
    
    //MARK: - Properties
    
    private var presnter = AuthPresenter()
    var mobileNumber = ""
    var code = ""
    var investmentAmount = ""
    var vc :OnBoardingFrame1?
    
    
    
    var latitude : String = ""{
        didSet{
            
        }
    }
    var longitude:String = ""{
        didSet{
          
        }
    }
    var minValueInvestment:String = ""{
        didSet{
          
        }
    }
    
    var maxValueInvestment : String = ""{
        didSet{
          
        }
    }
    var timeOfInvestment : String = ""{
        didSet{
          
        }
    }
    var onBoardingScreen = 0
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

//
//        self.contsinerView.subviews.first?.removeFromSuperview()
//
//        self.stepsIndicator.currentStep = 0
//        let vc=OnBoardingFrame1()
//        self.addChild(vc)
//        self.contsinerView.addSubview(vc.view)
////        self.onBoardingScreen=1
//        vc.didMove(toParent: self)
//        vc.view.frame = self.contsinerView.bounds
//        let text = vc.phoneNumberTxtField.text

//        print(text)
       checkS()
        
    }
    
    //MARK: - Private Handler
    
    @IBAction func continueBtn(_ sender: Any) {
        
        checkS()
        

    }
    
    
    func checkS(){
        
                switch self.onBoardingScreen{
        
                case 0:
                    self.onBoardingScreen=1
                    
                    self.contsinerView.subviews.first?.removeFromSuperview()
                    
                    self.stepsIndicator.currentStep = 0
                    vc=OnBoardingFrame1()
                    
                    self.addChild(vc!)
                    self.contsinerView.addSubview(vc!.view)
            //        self.onBoardingScreen=1
                    vc!.didMove(toParent: self)
                    vc!.view.frame = self.contsinerView.bounds
        
        //            self.presnter.signup(mobile: myString[0])
                    
                    break
                case 1:
                    
                    let text = vc!.phoneNumberTxtField.text
                    print(text ?? "")
                    
                    self.contsinerView.subviews.first?.removeFromSuperview()
        
                    self.stepsIndicator.currentStep = 1
                    let vc=VerificationVC()
                    self.addChild(vc)
                    self.contsinerView.addSubview(vc.view)
                    self.onBoardingScreen=2
                    vc.didMove(toParent: self)
                    vc.view.frame = self.contsinerView.bounds
        //            print(myString[0])
        //            print(myString[1])
        //            self.presnter.checkCode(mobile:myString[0] , code: myString[1])
                    break
                case 2:
                    self.contsinerView.subviews.first?.removeFromSuperview()
        
                    self.stepsIndicator.currentStep = 2
        
                    let vc=OnBoardingFrame2()
                    self.addChild(vc)
                    self.contsinerView.addSubview(vc.view)
                    self.onBoardingScreen=3
                    vc.didMove(toParent: self)
                    vc.view.frame = self.contsinerView.bounds
        //            print(myString[0])
        //            print(myString[1])
        //            self.latitude=myString[0]
        //            self.longitude=myString[1]
                    break
                case 3:
                    self.contsinerView.subviews.first?.removeFromSuperview()
        
                    self.stepsIndicator.currentStep = 3
        
                    let vc=OnBoardingFrame3()
                    self.addChild(vc)
                    self.contsinerView.addSubview(vc.view)
                    self.onBoardingScreen=4
                    vc.didMove(toParent: self)
                    vc.view.frame = self.contsinerView.bounds
        //            print(myString[0])
        //            print(myString[1])
        //            self.minValueInvestment=myString[0]
        //            self.maxValueInvestment=myString[1]
                    break
                case 4:
                    self.contsinerView.subviews.first?.removeFromSuperview()
        
                    self.stepsIndicator.currentStep = 4
        
                    let vc=OnBoardingFrame4()
                    self.addChild(vc)
                    self.contsinerView.addSubview(vc.view)
                    self.onBoardingScreen=5
                    vc.didMove(toParent: self)
                    vc.view.frame = self.contsinerView.bounds
        //            print(myString[0])
        //
        //            self.timeOfInvestment=myString[0]
        //            self.presnter.startInvestiment(latitude: self.latitude, longitude: self.longitude, work_type: self.timeOfInvestment, amount_raise: (Float(self.maxValueInvestment) ?? 0.0)-(Float(self.minValueInvestment) ?? 0.0))
                    break
                case 5:
                    self.contsinerView.subviews.first?.removeFromSuperview()
        
                    self.stepsIndicator.currentStep = 5
        
                    let vc=OnBoardingFrame5()
                    self.addChild(vc)
                    self.skipAction.isEnabled = false
                    self.skipAction.titleLabel?.textColor = .clear
                    //            skipAction.setTitleColor(.clear, for: .normal)
                    self.continueAction.setTitle("Welcome!", for: .normal)
                    self.contsinerView.addSubview(vc.view)
                    self.onBoardingScreen=6
                    break
                case 6:
                    let vc = MapVC()
                    self.sceneDelegate.setRootVC(vc: vc)
                    break
                default:
                    print("test")
    }
    
    }
    
    
    //MARK: - Containerview configuration
    
//    func checkStatus(){
//
//        NotificationCenter.default.addObserver(forName: .init(rawValue: "onBoarding"), object: nil, queue: .main) { notify in
//           let myString = notify.object as? [String] ?? []
//
//        }
//        func checkVC(){
//
//        switch self.onBoardingScreen{
//
//        case 0:
//            self.onBoardingScreen=1
//
//
//
////            print(myString[0])
////            self.presnter.signup(mobile: myString[0])
//            break
//        case 1:
//            self.contsinerView.subviews.first?.removeFromSuperview()
//
//            self.stepsIndicator.currentStep = 1
//            let vc=VerificationVC()
//            self.addChild(vc)
//            self.contsinerView.addSubview(vc.view)
//            self.onBoardingScreen=2
//            vc.didMove(toParent: self)
//            vc.view.frame = self.contsinerView.bounds
////            print(myString[0])
////            print(myString[1])
////            self.presnter.checkCode(mobile:myString[0] , code: myString[1])
//            break
//        case 2:
//            self.contsinerView.subviews.first?.removeFromSuperview()
//
//            self.stepsIndicator.currentStep = 2
//
//            let vc=OnBoardingFrame2()
//            self.addChild(vc)
//            self.contsinerView.addSubview(vc.view)
//            self.onBoardingScreen=3
//            vc.didMove(toParent: self)
//            vc.view.frame = self.contsinerView.bounds
////            print(myString[0])
////            print(myString[1])
////            self.latitude=myString[0]
////            self.longitude=myString[1]
//            break
//        case 3:
//            self.contsinerView.subviews.first?.removeFromSuperview()
//
//            self.stepsIndicator.currentStep = 3
//
//            let vc=OnBoardingFrame3()
//            self.addChild(vc)
//            self.contsinerView.addSubview(vc.view)
//            self.onBoardingScreen=4
//            vc.didMove(toParent: self)
//            vc.view.frame = self.contsinerView.bounds
////            print(myString[0])
////            print(myString[1])
////            self.minValueInvestment=myString[0]
////            self.maxValueInvestment=myString[1]
//            break
//        case 4:
//            self.contsinerView.subviews.first?.removeFromSuperview()
//
//            self.stepsIndicator.currentStep = 4
//
//            let vc=OnBoardingFrame4()
//            self.addChild(vc)
//            self.contsinerView.addSubview(vc.view)
//            self.onBoardingScreen=5
//            vc.didMove(toParent: self)
//            vc.view.frame = self.contsinerView.bounds
////            print(myString[0])
////
////            self.timeOfInvestment=myString[0]
////            self.presnter.startInvestiment(latitude: self.latitude, longitude: self.longitude, work_type: self.timeOfInvestment, amount_raise: (Float(self.maxValueInvestment) ?? 0.0)-(Float(self.minValueInvestment) ?? 0.0))
//            break
//        case 5:
//            self.contsinerView.subviews.first?.removeFromSuperview()
//
//            self.stepsIndicator.currentStep = 5
//
//            let vc=OnBoardingFrame5()
//            self.addChild(vc)
//            self.skipAction.isEnabled = false
//            self.skipAction.titleLabel?.textColor = .clear
//            //            skipAction.setTitleColor(.clear, for: .normal)
//            self.continueAction.setTitle("Welcome!", for: .normal)
//            self.contsinerView.addSubview(vc.view)
//            self.onBoardingScreen=6
//            break
//        case 6:
//            let vc = MapVC()
//            self.sceneDelegate.setRootVC(vc: vc)
//            break
//        default:
//            print("test")
//        }
//    }
//    }
}

//extension OnBoardingVC {
//
//    func SetUpContainerVC(vc:UIViewController,indicatorStep:Int,onboardingScreen:Int){
//
//        self.contsinerView.subviews.first?.removeFromSuperview()
//
//        self.stepsIndicator.currentStep = indicatorStep
//
//        self.vc=vc
//        self.addChild(vc)
//        self.contsinerView.addSubview(vc.view)
//        self.onBoardingScreen=onboardingScreen
//        vc.didMove(toParent: self)
//        vc.view.frame = self.contsinerView.bounds
//    }
//
//}
