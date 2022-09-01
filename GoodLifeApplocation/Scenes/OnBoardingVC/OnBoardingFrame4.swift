//
//  OnBoardingFrame4.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit

class OnBoardingFrame4: UIViewController {

    //MARK: - Outlet

    @IBOutlet weak var biWeekelyBtn: UIButtonDesignable!
    @IBOutlet weak var weekelyBtn: UIButtonDesignable!
    @IBOutlet weak var dailyBtn: UIButtonDesignable!
    
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        bindButtons()
        
    }

}

extension OnBoardingFrame4{
    func bindButtons(){
        biWeekelyBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
}
extension OnBoardingFrame4{
    @objc func buttonWasTapped( sender: UIButton){
        
        switch sender{
        case biWeekelyBtn:
            NotificationCenter.default.post(name: .init(rawValue: "onBoarding"), object: ["bi_weekly"])

        case weekelyBtn:
            NotificationCenter.default.post(name: .init(rawValue: "onBoarding"), object: ["weekly"])

        case dailyBtn:
            NotificationCenter.default.post(name: .init(rawValue: "onBoarding"), object: ["daily"])

        default:
            print("")
        }
    }
}
