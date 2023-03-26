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
    
}


typealias mainDelegate = MainDelegate & UIViewController

class MainPresenter:NSObject{
    
    var delegate :homeDelegate?
    
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
    
    
    
}
