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
    func getChannels(data:RecommendedChannel)
    

    
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
                    Alert.showErrorAlert(message: response.message ?? "")
                }
                
            case .failure(_):
                
                Alert.showErrorAlert(message: "something wrong try again")
            }
        }
    }
    
    func getChannels(){
        OpportuntiesManager.shared.getChannels { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getChannels(data: response.data!)
                }else{
                    Alert.showErrorAlert(message: response.message ?? "")
                }
                
            case .failure(_):
                
                Alert.showErrorAlert(message: "something wrong try again")
            }
        }
    }
    

    
    
    func completeOpportunity(interest:String,id:Int,financialModel:[String],workType:String,levelOfDifficulty:String,AmountOfTechnology:String,amountRasise:String,opportuntiesUrl:String,competitorsUrl:[String],commomWays:[String],topAdvertisingChannel:[String],socialChannels:[String],avgAnnualRevenu:String,avgMonthlyCost:String,categories:[String],marketGraph:[String:String]=[:]){
        OpportuntiesManager.shared.completeOpportunities(interest:interest,id: id, financialModel: financialModel, workType: workType, levelOfDifficulty: levelOfDifficulty, AmountOfTechnology: AmountOfTechnology, amountRasise: amountRasise, opportuntiesUrl: opportuntiesUrl, competitorsUrl: competitorsUrl, commomWays: commomWays, topAdvertisingChannel: topAdvertisingChannel, socialChannels: socialChannels, avgAnnualRevenu: avgAnnualRevenu, avgMonthlyCost: avgMonthlyCost, categories: categories, marketGraph: marketGraph)  { Response in
            switch Response{

                
            case let .success(response):
                if response.status == true{
                    Alert.showSuccessAlert(message: response.message ?? "")

                    self.delegate?.showAlerts(title:"Success", message: response.message ?? "")
                }else{
                    Alert.showErrorAlert(message: response.message ?? "")
                }
                
            case .failure(_):
                
                Alert.showErrorAlert(message: "something wrong try again")

        }
        }
    }
}
