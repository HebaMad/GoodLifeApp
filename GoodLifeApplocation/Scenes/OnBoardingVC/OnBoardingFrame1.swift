//
//  OnBoardingFrame1.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 05/08/2022.
//

import UIKit

class OnBoardingFrame1: UIViewController {
    
    //MARK: - Outlet

    @IBOutlet weak var phoneNumberTxtField: BottomBorderTextField!
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bindTexField()
    }

}

extension OnBoardingFrame1{
    func bindTexField(){
        phoneNumberTxtField.addTarget(self, action: #selector(TxtFieldWasWrittenValue), for: .editingDidEnd)
    }
}
extension OnBoardingFrame1{
    @objc func  TxtFieldWasWrittenValue(){
        NotificationCenter.default.post(name: .init(rawValue: "onBoarding"), object: [phoneNumberTxtField.text])

    }
}
