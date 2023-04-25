//
//  LiturgicalOpportunitiesCreation.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/03/2023.
//

import UIKit

class LiturgicalOpportunitiesCreation: UIViewController {

    @IBOutlet weak var marketSize: UISlider!
    @IBOutlet weak var marketName: UITextField!
    @IBOutlet weak var marketRate: UILabel!
    
    @IBOutlet weak var addMoreMarket: UIButton!
    
    @IBOutlet weak var commonWayValueTxt: BottomBorderTextField!
    
    @IBOutlet weak var addMoreWays: UIButton!
    
    var commomWaysWorship:[String]=[]
    var marketGraph:[String:String]=[:]
    var marketGraphName:[String]=[]
    var marketGraphSize:[String]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindButtons()
        bindUISliderValue()
    }


}
extension LiturgicalOpportunitiesCreation {
    
    func bindButtons(){
        
        addMoreMarket.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        addMoreWays.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
    }
    
    func bindUISliderValue(){
        marketSize.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    
    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
        case addMoreMarket:
            if marketName.text != "" && marketSize.value != 0.0{
                marketGraphName.append(marketName.text!)
                marketGraphSize.append("\(marketSize.value)")
                clearData()
                makeParameter(key: marketGraphName, value: marketGraphSize)

            }else{
                showSnackBar(message: "Add your Market Size")
            }
        case addMoreWays:
            if commonWayValueTxt.text != ""{
                commomWaysWorship.append(commonWayValueTxt.text!)
                commonWayValueTxt.text=""
            }else{
                showSnackBar(message: "Add Common ways to worship ")
            }

        default:
            print("")

        }
    }
    
    
}


extension LiturgicalOpportunitiesCreation{
        func makeParameter(key:[String],value:[String]) {
            marketGraph=[:]
            for indx in 0 ..< key.count{
                marketGraph["liturgical_graphs[\(indx)][title]"]=key[indx]
                marketGraph["liturgical_graphs[\(indx)][percentage]"]=value[indx]

            }
        }
    
    func clearData(){
        marketName.text=""
        marketSize.value=0.0
        marketRate.text="0%"
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        marketRate.text="\(Int(sender.value))%"
    }
}
