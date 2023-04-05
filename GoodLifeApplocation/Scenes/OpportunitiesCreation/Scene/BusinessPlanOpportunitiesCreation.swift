//
//  BusinessPlanOpportunitiesCreation.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/03/2023.
//

import UIKit

class BusinessPlanOpportunitiesCreation: UIViewController {

    @IBOutlet weak var planNameTxt: UITextField!
    @IBOutlet weak var marketSize: UISlider!
    @IBOutlet weak var marketRate: UILabel!
    @IBOutlet weak var planUrl: BottomBorderTextField!
    @IBOutlet weak var planPros: UITextView!
    @IBOutlet weak var planCons: UITextView!
    
    @IBOutlet weak var addNewPlan: UIButton!
    @IBOutlet weak var addMoreMarket: UIButton!
    @IBOutlet weak var nextBtn: UIButtonDesignable!
    
    
    var placeholder = " Add your description please ... "
    

    override func viewDidLoad() {
        super.viewDidLoad()

        bindButtons()
        txtviewCustomization()
    }




}
extension BusinessPlanOpportunitiesCreation {
    
    func bindButtons(){
        
        addMoreMarket.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        addNewPlan.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
        case addMoreMarket:
            print("")
        case addNewPlan:
            print("")

            
        default:
            print("")

        }
    }
    
    
}


extension BusinessPlanOpportunitiesCreation{
    func txtviewCustomization(){
        planPros.layer.cornerRadius = 8.0
        planPros.layer.borderColor = UIColor(named: "bg5")?.cgColor
        planPros.layer.borderWidth=0.5
        planPros.text = "Please add your plan pros"
        planPros.textColor = UIColor.lightGray
        planPros.delegate=self
        
        planCons.layer.cornerRadius = 8.0
        planCons.layer.borderColor = UIColor(named: "bg5")?.cgColor
        planCons.layer.borderWidth=0.5
        planCons.text = "Please add your plan cons"
        planCons.textColor = UIColor.lightGray
        planCons.delegate=self
        
        
        
    }
    
}

extension BusinessPlanOpportunitiesCreation:UITextViewDelegate{
    //MARK:- TextView Delegates
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Please add a short description"
            textView.textColor = UIColor.lightGray
            placeholder = ""
        } else {
            placeholder = textView.text
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeholder = textView.text
    }
    
}
