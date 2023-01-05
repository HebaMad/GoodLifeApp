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
    }}

extension VerificationVC{
    func bindTexField(){
        codeTxtField.addTarget(self, action: #selector(TxtFieldWasWrittenValue), for: .editingChanged)
    }
}

extension VerificationVC{
    @objc func  TxtFieldWasWrittenValue(){
        guard let code = codeTxtField.text, code.count > 0 else { return }
        

        let attributedString = NSMutableAttributedString(string: code)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(80), range: NSRange(location: 0, length: attributedString.length))
        self.codeTxtField.attributedText = attributedString
        
        
        if code.count == 4{
            self.view.endEditing(true)

            
        NotificationCenter.default.post(name: .init(rawValue: "onBoarding"), object: [codeTxtField.text])

    }
}
}
