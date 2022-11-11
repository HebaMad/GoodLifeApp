//
//  OnBoardingVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit
import MaterialComponents.MaterialSnackbar

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
    var vc:UIViewController?
    
    
    
    var latitude : String = ""{
        didSet{
            
        }
    }
    var longitude:String = ""{
        didSet{
          
        }
    }
    var minValueInvestment:Float = 0.0{
        didSet{
          
        }
    }
    
    var maxValueInvestment : Float = 0.0{
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
        onBoardingScreen=0
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
                    vc!.didMove(toParent: self)
                    vc!.view.frame = self.contsinerView.bounds
        
        //            self.presnter.signup(mobile: myString[0])
                    
                    break
                case 1:
                    
                    let text = (vc as! OnBoardingFrame1).phoneNumberTxtField.text
                    print(text ?? "")
                    if text?.isEmpty == true {
                        self.onBoardingScreen=1
                    showSnackBar(message: "please Enter your mobile number ")
                        
                    }else{
                        mobileNumber = text ?? ""

                    self.presnter.signup(mobile: text ?? "")
                        self.presnter.delegate = self
                    }
  
                    break
                case 2:
                    
                    let text = (vc as! VerificationVC).codeTxtField.text
                    print(text ?? "")
                    if text?.isEmpty == true {
                        self.onBoardingScreen=2
                        showSnackBar(message: "please Enter your Verification code ")

                        
                    }else{
                        self.presnter.checkCode(mobile:mobileNumber, code: text ?? "")
                        self.presnter.delegate = self
              
                    }
  
                    
                    break
                case 3:
                    latitude = (vc as! OnBoardingFrame2).lat
                    longitude = (vc as! OnBoardingFrame2).long
                    print(latitude)
                    print(longitude)
                    if latitude == "" && longitude == "" {
                        showSnackBar(message: "please we want your location to provide you an application services")

                    }else{

                    self.contsinerView.subviews.first?.removeFromSuperview()
        
                    self.stepsIndicator.currentStep = 3
        
                     vc=OnBoardingFrame3()
                    self.addChild(vc!)
                    self.contsinerView.addSubview(vc!.view)
                    self.onBoardingScreen=4
                    vc!.didMove(toParent: self)
                    vc!.view.frame = self.contsinerView.bounds
                    }
                    break
                case 4:
                    maxValueInvestment = (vc as! OnBoardingFrame3).maxvalue
                    minValueInvestment = (vc as! OnBoardingFrame3).minvalue
                    self.contsinerView.subviews.first?.removeFromSuperview()
        
                    self.stepsIndicator.currentStep = 4
        
                     vc=OnBoardingFrame4()
                    self.addChild(vc!)
                    self.contsinerView.addSubview(vc!.view)
                    self.onBoardingScreen=5
                    vc!.didMove(toParent: self)
                    vc!.view.frame = self.contsinerView.bounds
     
                    
                    break
                case 5:
                    timeOfInvestment = (vc as! OnBoardingFrame4).choice
                    self.presnter.startInvestiment(latitude: self.latitude, longitude: self.longitude, work_type: self.timeOfInvestment, amount_raise: self.maxValueInvestment-self.minValueInvestment)
                    self.contsinerView.subviews.first?.removeFromSuperview()
        
                    self.stepsIndicator.currentStep = 5
        
                     vc=OnBoardingFrame5()
                    self.addChild(vc!)
                    self.skipAction.isEnabled = false
                    self.skipAction.titleLabel?.textColor = .clear
                    //            skipAction.setTitleColor(.clear, for: .normal)
                    self.continueAction.setTitle("Welcome!", for: .normal)
                    self.contsinerView.addSubview(vc!.view)
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
}
    
extension OnBoardingVC{
    func showSnackBar(message:String){
        let answerMessage = MDCSnackbarMessage()
        answerMessage.text =  message

        MDCSnackbarManager.default.show(answerMessage)
    }
}

extension OnBoardingVC:AuthDelegate{
    func getuserToken(data: userProfile) {
                do{
                    try KeychainWrapper.set(value: "Bearer"+" "+data.access_token! , key: data.mobile ?? "")
                    AppData.mobile = data.mobile ?? ""
               
        } catch let error {
            print(error)
    }
    }
  
    func checkStatus(status: Bool, msg: String, screen: String) {
        
        if status == true{
            if screen == "signup"{
            self.contsinerView.subviews.first?.removeFromSuperview()
            showSnackBar(message: msg)

            self.stepsIndicator.currentStep = 1
                vc = VerificationVC()
                self.addChild(vc!)
                self.contsinerView.addSubview(vc!.view)
            self.onBoardingScreen=2
                vc!.didMove(toParent: self)
                vc!.view.frame = self.contsinerView.bounds
            }else{
                self.contsinerView.subviews.first?.removeFromSuperview()
                showSnackBar(message: msg)

                self.stepsIndicator.currentStep = 2
    
                 vc = OnBoardingFrame2()
                self.addChild(vc!)
                self.contsinerView.addSubview(vc!.view)
                self.onBoardingScreen=3
                vc!.didMove(toParent: self)
                vc!.view.frame = self.contsinerView.bounds
            }
            
        }else{
            showSnackBar(message: msg)

        }
    }
    
    func showAlerts(title: String, message: String) {
        showSnackBar(message: message)
    }
    
    
}
