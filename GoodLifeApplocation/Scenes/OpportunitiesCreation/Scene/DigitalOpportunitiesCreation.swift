//
//  DigitalOpportunitiesCreation.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/03/2023.
//

import UIKit

class DigitalOpportunitiesCreation: UIViewController {

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var opportunitiesUrl: BottomBorderTextField!
    
    @IBOutlet weak var competitorUrl: BottomBorderTextField!
    
    
    var competitorsUrl:[String]=[]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindButtons()
        bindTextField()
    }
    
    
}

extension DigitalOpportunitiesCreation{
    
    func bindButtons(){
        addBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
    func bindTextField(){
        competitorUrl.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        opportunitiesUrl.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

    }
    
    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
  
        case addBtn:
            if competitorUrl.text != "" && competitorUrl.text != "https://"{
                competitorsUrl.append(competitorUrl.text!)
                competitorUrl.text="https://"
            }else{
                showSnackBar(message: "Add your Financial Model ")
            }

        default:
            print("")
        }
    }
    
    
    @objc func textFieldDidChange(textField: UITextField){
        
        guard let text = textField.text else { return }
        
        
        if !text.hasPrefix("https://") {
            textField.text = "https://" + " " + text
        }
    }
}
