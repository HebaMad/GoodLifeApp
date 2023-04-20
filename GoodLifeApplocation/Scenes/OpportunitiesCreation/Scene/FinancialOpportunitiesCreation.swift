//
//  FinancialOpportunitiesCreation.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/03/2023.
//

import UIKit

class FinancialOpportunitiesCreation: UIViewController {
    
    @IBOutlet weak var AverageAnnualRevenuTxt: UITextField!
    @IBOutlet weak var avaregeMonthlyCost: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avaregeMonthlyCost.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        AverageAnnualRevenuTxt.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        
    }
    

    
    @objc func textFieldDidChange(textField: UITextField){
        
        guard let text = textField.text else { return }
        
        
        if !text.hasPrefix("$") {
            textField.text = "$" + " " + text
        }
    }
}
