//
//  MenuPresenter.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/08/2022.
//

import Foundation
import UIKit
protocol MenuDelegate{
    func showAlert(title:String,message:String)


}
typealias menuDelegate = MenuDelegate & UIViewController

class MenuPresenter:NSObject{
    
    var delegate:menuDelegate?
        
    private func VolunteerOppourtinity(title:String,latitude:String,longitude:String,date:String,time:String,details:String){
      
        MenuManager.shared.volunteerOppourtinity(title: title, latitude: latitude, longitude: longitude, date: date, time: time, details: details) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlert(title:"Success", message: response.message)

                }else{
                    self.delegate?.showAlert(title:"Failure", message: response.message)

                }
                
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    
    private func createIdea(title:String,details:String,time_commitment:String,monthly_revenue:String){
        MenuManager.shared.createIdea(title: title, details: details, time_commitment: time_commitment, monthly_revenue:monthly_revenue ) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlert(title:"Success", message: response.message)

                }else{
                    self.delegate?.showAlert(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")
            }
            
        }
    }
    private func createFeedback(title:String,review:String,rate:String,img:Data){
        MenuManager.shared.createFeedback(title: title, review: review, rate: rate, img: img) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlert(title:"Success", message: response.message)

                }else{
                    self.delegate?.showAlert(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")
            }
            
        }
        
    }
    
}
