//
//  DonationVC.swift
//  GoodLifeApplocation
//  Created by heba isaa on 25/07/2022.

import UIKit

class DonationVC: UIViewController {
    //MARK: - Outlet
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var noOfDonation: UILabel!
    @IBOutlet weak var donationDescription: UILabel!
    @IBOutlet weak var stepsIndicator: StepIndicatorView!
    @IBOutlet weak var containerView: UIView!
    
    //MARK: - Life cycle
    
    
    var funderID=0
    let presenter=MenuPresenter()
    var worthyData:[Founder]=[]
    var worthySubData:Founder?
    
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.getWorthyCause()
        self.presenter.delegate = self
        self.stepsIndicator.currentStep = 0
        let vc = DonationFirstFrame()
        self.addChild(vc)
        self.containerView.addSubview(vc.view)
        vc.didMove(toParent: self)
        vc.view.frame = self.containerView.bounds
        self.containerHeight.constant=CGFloat(700)

        notificationcenterSetup()
    }
    @IBAction func backAction(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Notification center setup

    func notificationcenterSetup(){
        NotificationCenter.default.addObserver(forName: .init(rawValue: "GoodLife"), object: nil, queue: .main) { notify in
            guard let myString = notify.object as? [Int] else { return }
            print(myString)
            switch myString[0]{
            case 1:
                self.containerView.subviews.first?.removeFromSuperview()
                self.stepsIndicator.currentStep = 1
                self.funderID = myString[2]
                self.presenter.getSubWorthyCause(worthyCauseID:  self.funderID){ status,data,message in
                    let vc = DonationFrameTwoVC.instantiate()
                    vc.subWorthyCause = data.worthy_causes
                    self.worthyData=data.worthy_causes
                    self.addChild(vc)
                    self.containerView.addSubview(vc.view)
                    vc.didMove(toParent: self)
                    vc.view.frame = self.containerView.bounds
                    self.containerHeight.constant=CGFloat(myString[1])
                    
                }
             
            case 2:
                self.worthySubData=self.worthyData[myString[2]]
                self.containerView.subviews.first?.removeFromSuperview()

                self.stepsIndicator.currentStep = 2
                let vc=DonationThirdFrame()
                vc.detailsData=self.worthySubData
                self.addChild(vc)
                self.containerView.addSubview(vc.view)
                vc.didMove(toParent: self)
                vc.view.frame = self.containerView.bounds
                self.containerHeight.constant=CGFloat(myString[1])

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


extension DonationVC:MenuDelegate{
    func showAlerts(title: String, message: String) {
        //
    }
    
    func getFunderData(data: WorthyCauses) {
        titleTxt.text = data.donation_details?.title
        noOfDonation.text = data.donation_details?.sub_title
        donationDescription.text = data.donation_details?.details

    }
    
 
    
    
}
