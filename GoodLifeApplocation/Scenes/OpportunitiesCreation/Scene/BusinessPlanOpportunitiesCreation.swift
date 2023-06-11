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
        bindUISliderValue()
        bindButtons()
        bindTxtFields()
        txtviewCustomization()
    }
    
    
}
extension BusinessPlanOpportunitiesCreation {
    
    func bindButtons(){
        
        addNewPlan.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
    }
    
    func bindTxtFields(){
        planUrl.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    
    func bindUISliderValue(){
        marketSize.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
            
        case addNewPlan:
            checkData()
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
    
    func checkData(){
        if  planNameTxt.text != "" {
            
            if planUrl.text != "" &&  planUrl.text != "https://" {
                
                if planPros.text != "" && planPros.text != "Please add your plan pros"{
                    
                    if planCons.text != "" && planCons.text != "Please add your plan cons"{
                        
                        if marketSize.value != 0 {
                            makeParameter()
                            clearData()
                        }else{
                            showSnackBar(message: "select your Business plan market size")

                            
                        }
                        
                        
                    }else{
                        showSnackBar(message: "Add your Business plan Cons")

                    }
                    
                    
                }else{
                    showSnackBar(message: "Add your Business plan Pros")

                    
                }
                
                
            }else{
                
                showSnackBar(message: "Add your Business plan Url")

                
            }
            
        }else{
            
            showSnackBar(message: "Add your Business plan Name")

            
        }
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
        businessplan["business_plans[\(index)][url]"] =  (planUrl.text ?? "")
        businessplan["business_plans[\(index)][market_size]"] = "\(marketSize.value)"
        businessplan["business_plans[\(index)][pros]"] = planPros.text
        businessplan["business_plans[\(index)][cons]"] = planCons.text
        index += 1
    }
    
    func clearData(){
        planNameTxt.text=""
        planUrl.text="https://"
        planCons.text=""
        planPros.text=""
        marketSize.value=0.0
        marketRate.text="0%"
        
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        
        guard let text = textField.text else { return }
        
        
        if !text.hasPrefix("https://") {
            textField.text = "https://" + " " + text
        }
    }
    
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        marketRate.text="\(Int(sender.value))%"
    }
    
}
