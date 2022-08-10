//
//  DonationVC.swift
//  GoodLifeApplocation
//  Created by heba isaa on 25/07/2022.

import UIKit

class DonationVC: UIViewController {
    //MARK: - Outlet

    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var noOfDonation: UILabel!
    @IBOutlet weak var donationDescription: UILabel!
    @IBOutlet weak var stepsIndicator: StepIndicatorView!
    @IBOutlet weak var containerView: UIView!
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.stepsIndicator.currentStep = 0
        let vc = DonationFirstFrame()
        self.addChild(vc)
        self.containerView.addSubview(vc.view)
        vc.didMove(toParent: self)
        vc.view.frame = self.containerView.bounds
        notificationcenterSetup()
    }
    
    //MARK: - Notification center setup

    func notificationcenterSetup(){
        NotificationCenter.default.addObserver(forName: .init(rawValue: "GoodLife"), object: nil, queue: .main) { notify in
            guard let myString = notify.object as? Int else { return }
            switch myString{
            case 1:
                self.containerView.subviews.first?.removeFromSuperview()
                self.stepsIndicator.currentStep = 1
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DonationFrameTwoVC") as! DonationFrameTwoVC
                self.addChild(vc)
                self.containerView.addSubview(vc.view)
                vc.didMove(toParent: self)
                vc.view.frame = self.containerView.bounds
            case 2:
                self.containerView.subviews.first?.removeFromSuperview()

                self.stepsIndicator.currentStep = 2
                let vc=DonationThirdFrame()

                self.addChild(vc)
                self.containerView.addSubview(vc.view)
                vc.didMove(toParent: self)
                vc.view.frame = self.containerView.bounds

            case 3:
                self.containerView.subviews.first?.removeFromSuperview()
                self.stepsIndicator.currentStep = 3
                let vc=DonationFourthFrame()
                self.addChild(vc)
                self.containerView.addSubview(vc.view)
                vc.didMove(toParent: self)
                vc.view.frame = self.containerView.bounds
            default:
                print("error click")
            }
   
        }
    }


}
