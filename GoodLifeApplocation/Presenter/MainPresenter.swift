//
//  MainPresenter.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/03/2023.
//

import UIKit

protocol MainDelegate{
    
    func showAlerts(title:String,message:String)
    func getMainScreenData(data:MainScreenData)
    func getOpportunitiesData(data:ListOpportunities)
    
}


typealias mainDelegate = MainDelegate & UIViewController

class MainPresenter:NSObject{
    
    var delegate :mainDelegate?
    
    func getMainScreenData(){
        
        HomeManager.shared.homescreen { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getMainScreenData(data: response.data!)
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case .failure(_):
                
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
        }
    
    func deleteOpportunities(opportunity_id:String){
        MainManager.shared.deleteOpportunities(opportunity_id: opportunity_id) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlerts(title: "Success", message: response.message!)
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case .failure(_):
                
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    func listOpportunties(search:String){
        MainManager.shared.listOpportunities(search: search) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getOpportunitiesData(data: response.data!)
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
                }
                
            case .failure(_):
                
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
        
    }
    
    
    
}
