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
    var businessplan:[String:String]=[:]
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindButtons()
        txtviewCustomization()
    }
    
    
    
    
}
extension BusinessPlanOpportunitiesCreation {
    
    func bindButtons(){
        
        addNewPlan.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
            
        case addNewPlan:
            makeParameter()
            clearData()
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


extension BusinessPlanOpportunitiesCreation {
    
    func makeParameter(){
        
        businessplan["business_plans[\(index)][name]"] = planNameTxt.text
        businessplan["business_plans[\(index)][url]"] = planUrl.text
        businessplan["business_plans[\(index)][market_size]"] = "\(marketSize.value)"
        businessplan["business_plans[\(index)][pros]"] = planPros.text
        businessplan["business_plans[\(index)][cons]"] = planCons.text
        index += 1
    }
    
    func clearData(){
        planNameTxt.text=""
        planUrl.text=""
        planCons.text=""
        planPros.text=""
        marketSize.value=0.0
    }
    
}
