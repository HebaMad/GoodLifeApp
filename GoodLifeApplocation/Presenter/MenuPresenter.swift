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
    func getFundTypeData(data:FundType)
    func getMyResource(data:StewardingMyResource)
}

typealias menuDelegate = MenuDelegate & UIViewController
typealias subWorthyCallback = ( _ status: Bool,_ data:SubWorthyCauses,_ message:String ) -> Void

class MenuPresenter:NSObject{
    
    var delegate:menuDelegate?
    
    func VolunteerOppourtinity(title:String,location:String,date:String,time:String,details:String){
        
        MenuManager.shared.volunteerOppourtinity(title: title, location:location, date: date, time: time, details: details) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlerts(title:"Success", message: response.message ?? "")
                    
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case  .failure(_):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    func updateMinistryIdea(ministryIdeaID:String,title:String,details:String,time_commitment:String,monthly_revenue:String,fund_type_id:String,location:String){
        SettingManager.shared.editMinistryIdea(ministryIdeaID: ministryIdeaID, title: title, details: details, time_commitment: time_commitment, monthly_revenue: monthly_revenue, fund_type_id: fund_type_id, location: location) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlerts(title:"Success", message: response.message ?? "")

                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
            case  .failure(_):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
                
            }
        }
    }
    
    func editVolunteerRequest(volunteerrequestId:String,title:String,location:String,date:String,time:String,details:String){
        SettingManager.shared.editVolunteerRequest(volunteerrequestId: volunteerrequestId, title: title, location: location, date: date, time: time, details: details) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlerts(title:"Success", message: response.message ?? "")

                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
            case  .failure(_):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
                
            }
        }
    }
    func createIdea(title:String,details:String,time_commitment:String,monthly_revenue:String,fund_type_id:String ,location:String ){
        MenuManager.shared.createIdea(title: title, details: details, time_commitment: time_commitment, monthly_revenue:monthly_revenue,fund_type_id:fund_type_id ,location:location ) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlerts(title:"Success", message: response.message ?? "")
                    
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case  .failure(_):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
            
        }
    }
    func createFeedback(id:String,review:String,ratings:[String:String]){
        MenuManager.shared.createFeedback(id: id, review: review,ratings: ratings ) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlerts(title:"Success", message: response.message ?? "")
                    
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case  .failure(_):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
            
        }
        
    }
    
    
    func getWorthyCause(){
        MenuManager.shared.getWorthyCauses { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getFunderData(data: response.data!)
                    
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case .failure(_):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    func getSubWorthyCause(worthyCauseID:Int,callback:@escaping subWorthyCallback){
        MenuManager.shared.getSubWorthyCauses(worthycauseId:worthyCauseID) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    callback(response.status ?? false, response.data!, response.message ?? "")
                    
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
            case .failure(_):
                
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    func makeDonation(worthyCauseID:Int,amount:String){
        
        MenuManager.shared.makeDonation(worthycauseId: worthyCauseID, amount: amount) {Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case .failure(_):
                
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    func getFundType(){
        MenuManager.shared.fundType { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getFundTypeData(data: response.data!)
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case .failure(_):
                
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    func getStewardingMyResource(){
        MenuManager.shared.stewardingMyResourse { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getMyResource(data: response.data!)
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case .failure(_):
                
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
        
    }
    
    func updateStewardingTime(timePerHour:String,timePerMonth:String){
        MenuManager.shared.updateStewardingTime(timePerHour: timePerHour, timePerMonth: timePerMonth) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case .failure(_):
                
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    func updateAvailableSupportMoney(availableSupportMoney:String){
        MenuManager.shared.updateAvailableSupportMoney(availableSupport: availableSupportMoney) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case .failure(_):
                
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    func updateTalent(talent:[String]){
        MenuManager.shared.updateTalent(talent: talent) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case .failure(_):
                
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    func updateIntrest(intrest:[String]){
        MenuManager.shared.updateInterest(intrest: intrest) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case .failure(_):
                
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
}
