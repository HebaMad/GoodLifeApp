//
//  OpportuntiesTarget.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/04/2023.
//

import Foundation

import Moya
enum OpportuntiesApiTarget:TargetType{

    case fundType
    case getChannels
    case completeOpportunities(id:Int,financialModel:[String],workType:String,levelOfDifficulty:String,AmountOfTechnology:String,amountRasise:String,opportuntiesUrl:String,competitorsUrl:[String],commomWays:[String],topAdvertisingChannel:[String],socialChannels:[String],avgAnnualRevenu:String,avgMonthlyCost:String,categories:[String],marketGraph:[String:String],intrest:String)
    
    case opportunitiesDetails(id:String)
    
    var baseURL: URL {
        return URL(string: "\(AppConfig.apiBaseUrl)")!
    }
    
    var path: String {
        switch self {

        case .fundType:return "getFundTypes"
        case .getChannels:return "getChannels"
        case .completeOpportunities:return "completeOpportunity"
            
        case .opportunitiesDetails:return "completeOpportunity"
            
        }
    }
    
    
    var method: Moya.Method {
        switch self{
        case .fundType,.getChannels,.opportunitiesDetails:
            return .get
            
        case .completeOpportunities:
            return .post

        }
    }
    
    var task: Task{
        switch self{

        case .fundType,.getChannels,.opportunitiesDetails:
            return .requestPlain

        case .completeOpportunities:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)

        }
    }
    
    
    var headers: [String : String]?{
        switch self{
        case .fundType,.getChannels,.completeOpportunities,.opportunitiesDetails:
            
            do {
                let token = try KeychainWrapper.get(key: AppData.mobile) ?? ""
                return ["Authorization":token ,"Accept":"application/json","Accept-Language":"en"]
            }
            catch{
                return ["Accept":"application/json","Accept-Language":"en"]
            }

  
            
        }
    }
    var param: [String : Any]{
        
        switch self {

        case .completeOpportunities(let id,let financialModel,let workType,let levelOfDifficulty,let AmountOfTechnology, let amountRasise, let opportuntiesUrl,let competitorsUrl ,let commomWays,let topAdvertisingChannel, let socialChannels, let avgAnnualRevenu,let avgMonthlyCost,let categories,let marketGraph,let intrest):
            
            return ["opportunity_id":id,"financial_models":financialModel ,"work_type":workType,"level_of_difficulty":levelOfDifficulty,"amount_of_technology":AmountOfTechnology,"amount_raise":amountRasise,"url":opportuntiesUrl,"competitors":competitorsUrl,"common_ways":commomWays,"top_advertising_platforms":topAdvertisingChannel,"recommended_social_channels":socialChannels,"average_annual_revenue":avgAnnualRevenu,"average_monthly_cost":avgMonthlyCost,"category":categories,"interest":intrest].merging(marketGraph){(_, new) in new}
            
        case .opportunitiesDetails(let id):
            return ["id":id]
        default : return [:]

            
        }
}

}
