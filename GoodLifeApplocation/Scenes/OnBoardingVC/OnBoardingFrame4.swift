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
    var choice = ""
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        bindButtons()
        
    }

}
//MARK: - Binding

extension OnBoardingFrame4{
    func bindButtons(){
        biWeekelyBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        weekelyBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        dailyBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)

    }
}

//MARK: - Private Handler

extension OnBoardingFrame4{
    @objc func buttonWasTapped( sender: UIButton){
        
        switch sender{
        case biWeekelyBtn:
            choice = biWeekelyBtn.currentTitle ?? ""
            biWeekelyBtn.bgColor = UIColor(named: "ButtonColor") ?? .white

        case weekelyBtn:
            choice = weekelyBtn.currentTitle ?? ""
            weekelyBtn.bgColor = UIColor(named: "ButtonColor") ?? .white
        case dailyBtn:
            choice = dailyBtn.currentTitle ?? ""
            dailyBtn.bgColor = UIColor(named: "ButtonColor") ?? .white


        default:
            print("")
        }
    }
}
