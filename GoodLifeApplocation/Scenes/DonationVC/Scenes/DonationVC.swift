//
//  DonationVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 25/07/2022.
//

import UIKit

class DonationVC: UIViewController {

    @IBOutlet weak var stepsIndicator: StepIndicatorView!
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.stepsIndicator.currentStep = 0
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DonationFrameTwoVC") as! DonationFrameTwoVC
        self.addChild(vc)
        self.containerView.addSubview(vc.view)
        notificationcenterSetup()
    }
    func notificationcenterSetup(){
        NotificationCenter.default.addObserver(forName: .init(rawValue: "GoodLife"), object: nil, queue: .main) { notify in
            guard let myString = notify.object as? Int else { return }
            switch myString{
            case 1:
                self.stepsIndicator.currentStep = 1
                let vc=DonationThirdFrame()
                self.addChild(vc)
                self.containerView.addSubview(vc.view)
            case 2:
                self.stepsIndicator.currentStep = 2
                let vc=DonationFourthFrame()
                self.addChild(vc)
                self.containerView.addSubview(vc.view)
            case 3:
                self.stepsIndicator.currentStep = 3
                let vc=DonationFifthFrameVC()
                self.addChild(vc)
                self.containerView.addSubview(vc.view)
            default:
                print("error click")
            }
   
        }
    }


}
