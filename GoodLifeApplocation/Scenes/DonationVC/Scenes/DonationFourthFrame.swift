//
//  DonationFourthFrame.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/07/2022.
//

import UIKit

class DonationFourthFrame: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var orderImage: UIImageViewDesignable!
    
    @IBOutlet weak var mealMarkerBtn: UIButton!
    @IBOutlet weak var claimNftBtn: UIButtonDesignable!
    
    
    //MARK: - Life CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindButton()
    }
}

//MARK: - Binding
private extension DonationFourthFrame{
    func bindButton(){
        claimNftBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        mealMarkerBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
    }
}

//MARK: - Private Handler

extension DonationFourthFrame{
    @objc func buttonWasTapped( sender: UIButton){
        
        switch sender{
        case claimNftBtn:
            let vc = DashboardVC.instantiate()
            self.sceneDelegate.setRootVC(vc: vc)
            
        case mealMarkerBtn:
            let vc = DonationFifthFrameVC()
            self.sceneDelegate.setRootVC(vc: vc)

        
            
        default:
            print("")
        }
    }
}

