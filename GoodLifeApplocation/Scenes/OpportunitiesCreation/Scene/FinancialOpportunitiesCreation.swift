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
    
    //MARK: - Properties
    var financialData:financialInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avaregeMonthlyCost.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        AverageAnnualRevenuTxt.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        setupdata()
        
    }
    
    func setupdata() {
        AverageAnnualRevenuTxt.text = financialData?.average_annual_revenue ?? ""
        avaregeMonthlyCost.text = financialData?.average_monthly_cost ?? ""

    }

    
    @objc func textFieldDidChange(textField: UITextField){
        
        guard let text = textField.text else { return }
        
        
        if !text.hasPrefix("$") {
            textField.text = "$" + " " + text
        }
    }
}
