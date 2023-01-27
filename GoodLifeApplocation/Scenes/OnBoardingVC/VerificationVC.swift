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
     var isClicked: Bool = false
    
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
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(70), range: NSRange(location: 0, length: attributedString.length))
        self.codeTxtField.attributedText = attributedString
        
        
            if self.codeTxtField.text?.count == 4{
                self.view.endEditing(true)
                sendObserver()
           
    }
        
}
    
    
    
    func sendObserver(){
        if isClicked == false {
            isClicked = true
            NotificationCenter.default.post(name: .init(rawValue: "onBoarding"), object: [codeTxtField.text])

        }
    }
}
