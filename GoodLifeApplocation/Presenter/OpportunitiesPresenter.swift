//
//  OpportunitiesPresenter.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/04/2023.
//

import Foundation
import UIKit

protocol OpportunitiesDelegate{
    
    func showAlerts(title:String,message:String)
    func getFundTypeData(data:FundType)

    
}

typealias opportunitiesDelegate = OpportunitiesDelegate & UIViewController

class OpportunitiesPresenter:NSObject{
    
    var delegate :opportunitiesDelegate?
    
    func getFundType(){
        OpportuntiesManager.shared.fundType { Response in
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
}
