//
//  MenuPresenter.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/08/2022.
//

import Foundation
import UIKit
protocol MenuDelegate{
    func showAlerts(title:String,message:String)
    func getFunderData(data:WorthyCauses)



}
typealias menuDelegate = MenuDelegate & UIViewController
typealias subWorthyCallback = ( _ status: Bool,_ data:SubWorthyCauses,_ message:String ) -> Void

class MenuPresenter:NSObject{
    
    var delegate:menuDelegate?
        
    func VolunteerOppourtinity(title:String,location:String,date:String,time:String,details:String){
      
        MenuManager.shared.volunteerOppourtinity(title: title, location:location, date: date, time: time, details: details) { Response in
            switch Response{
                
            case let .success(response):
                if response.code == 200{
                    self.delegate?.showAlerts(title:"Success", message: response.message)

                }else if response.code == 401{
                    SceneDelegate.init().setRootVC(vc: SplashScreen())
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    
     func createIdea(title:String,details:String,time_commitment:String,monthly_revenue:String){
        MenuManager.shared.createIdea(title: title, details: details, time_commitment: time_commitment, monthly_revenue:monthly_revenue ) { Response in
            switch Response{
                
            case let .success(response):
                if response.code == 200{
                    self.delegate?.showAlerts(title:"Success", message: response.message)

                }else if response.code == 401{
                    SceneDelegate.init().setRootVC(vc: SplashScreen())
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
            
        }
    }
     func createFeedback(id:String,review:String,rate:Int,img:Data){
         MenuManager.shared.createFeedback(id: id, review: review, rate: rate, img: img) { Response in
            switch Response{
                
            case let .success(response):
                if response.code == 200{
                    self.delegate?.showAlerts(title:"Success", message: response.message)

                }else if response.code == 401{
                    SceneDelegate.init().setRootVC(vc: SplashScreen())
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
            
        }
        
    }
    
    
    func getWorthyCause(){
        MenuManager.shared.getWorthyCauses { Response in
            switch Response{
                
            case let .success(response):
                if response.code == 200{
                    self.delegate?.getFunderData(data: response.data!)

                }else if response.code == 401{
                    SceneDelegate.init().setRootVC(vc: SplashScreen())
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    func getSubWorthyCause(worthyCauseID:Int,callback:@escaping subWorthyCallback){
        MenuManager.shared.getSubWorthyCauses(worthycauseId:worthyCauseID) { Response in
            switch Response{
                
            case let .success(response):
                if response.code == 200{
                    callback(response.status, response.data!, response.message)
                }else if response.code == 401{
                    SceneDelegate.init().setRootVC(vc: SplashScreen())
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message)
                }
            case let .failure(error):

                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    func makeDonation(worthyCauseID:Int,amount:String){
        
        MenuManager.shared.makeDonation(worthycauseId: worthyCauseID, amount: amount) {Response in
            switch Response{
                
            case let .success(response):
                if response.code == 200{
                }else if response.code == 401{
                    SceneDelegate.init().setRootVC(vc: SplashScreen())
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message)
                }
                
            case let .failure(error):

                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
        
    }
}
