//
//  VerificationVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 05/08/2022.
//

import UIKit

class VerificationVC: UIViewController {
    
    //MARK: - Outlet

    @IBOutlet weak var codeTxtField: BottomBorderTextField!
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        bindTexField()
    }




}
extension VerificationVC{
    func bindTexField(){
        codeTxtField.addTarget(self, action: #selector(TxtFieldWasWrittenValue), for: .editingChanged)
    }
}
extension VerificationVC{
    @objc func  TxtFieldWasWrittenValue(){
        NotificationCenter.default.post(name: .init(rawValue: "onBoarding"), object: [codeTxtField.text])

    }
}
