//
//  ProgressView.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/07/2022.
//

import Foundation
import  UIKit
class ProgressView: UIViewFromNib{

    @IBOutlet weak var stepNo: UILabel!
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var progressBar:StepIndicatorView!
 
    var title:String?{
        didSet{
            DispatchQueue.main.async {
                self.titleLbl.text = self.title ?? ""
            }
        }
    }
    
    
    
    
    
    func nextStep(){
        DispatchQueue.main.async { [weak self ] in
            
            guard let self = self  else { return }
//            self.progressBar.nextStep()
            self.progressBar.currentStep = self.progressBar.currentStep+1
            self.stepNo.text = "STEP  \(self.progressBar.currentStep+1)"
        }
        
        
    }
    func previousStep(){
        DispatchQueue.main.async { [weak self ] in
            
            guard let self = self  else { return }
            self.progressBar.currentStep = self.progressBar.currentStep-1
            self.stepNo.text = "STEP  \(self.progressBar.currentStep+1)"
        }
        
    }
    
    func setNumberOfStep(_ steps:Int){
        DispatchQueue.main.async { [weak self ] in
            
            guard let self = self  else { return }
//            self.progressBar.count = steps
             
        }
        
    }
    
}
