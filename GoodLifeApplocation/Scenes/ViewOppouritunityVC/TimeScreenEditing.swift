//
//  TimeScreenEditing.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 14/02/2023.
//

import UIKit
protocol DataTransfered{
    
    func  getData(time:[Time])
    
}

class TimeScreenEditing: UIViewController {
    
    @IBOutlet weak var timePerWeekTxt: UILabel!
    @IBOutlet weak var timePerWeekSlider: UISlider!
    
    @IBOutlet weak var timePerMonthSlider: UISlider!
    @IBOutlet weak var timePerMonthTxt: UILabel!
    
    var onSheetDissmissed:DataTransfered?
    
    let presenter=MenuPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderValueChanged()
    }
    
    
    func sliderValueChanged(){
        timePerWeekSlider.addTarget(self, action: #selector(SliderWasChanged), for: .valueChanged)
        timePerMonthSlider.addTarget(self, action: #selector(SliderWasChanged), for: .valueChanged)

    }
    
    @objc func SliderWasChanged( _ sender:UISlider){
        switch sender{
        case timePerWeekSlider:
            timePerWeekTxt.text = String(Int(timePerWeekSlider.value)) + "h"
        case timePerMonthSlider:
            timePerMonthTxt.text = String(Int(timePerMonthSlider.value)) + "h"

        default:
            print("")
        }
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        if timePerMonthTxt.text != "" && timePerWeekTxt.text != "" {
            presenter.updateStewardingTime(timePerHour: String(Int(timePerWeekSlider.value)), timePerMonth: String(Int(timePerMonthSlider.value)))
            let time = [ Time(title: "TimePerWeek", value: String(Int(timePerWeekSlider.value))),Time(title: "TimePerMonth", value: String(Int(timePerMonthSlider.value)))]
         
            self.dismiss(animated: true) {
                
                if let _delegate = self.onSheetDissmissed {
                    _delegate.getData(time: time)
                }
            }
            
        }else{
            Alert.showErrorAlert(message: (" Please select  your times "))
            
        }
        
        
        
    }
}
