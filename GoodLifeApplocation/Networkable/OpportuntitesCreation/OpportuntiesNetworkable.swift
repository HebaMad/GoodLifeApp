//
//  OpportuntiesNetworkable.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/04/2023.
//

import Foundation
import Moya
protocol OpportuntiesNetworkable:Networkable  {
    
    func fundType(completion: @escaping (Result<BaseResponse<FundType>, Error>)-> ())
    func getChannels(completion: @escaping (Result<BaseResponse<RecommendedChannel>, Error>)-> ())
    func completeOpportunities(interest:String,id:Int,financialModel:[String],workType:String,levelOfDifficulty:String,AmountOfTechnology:String,amountRasise:String,opportuntiesUrl:String,competitorsUrl:[String],commomWays:[String],topAdvertisingChannel:[String],socialChannels:[String],avgAnnualRevenu:String,avgMonthlyCost:String,categories:[String],marketGraph:[String:String],completion: @escaping (Result<BaseResponse<Empty>, Error>)-> ())
    func opportunitiesDetails(id:String,completion: @escaping (Result<BaseResponse<opportunitiesDetails>, Error>)-> ())
}

class OpportuntiesManager:OpportuntiesNetworkable {
 
 
    typealias targetType = OpportuntiesApiTarget

    var provider: MoyaProvider<OpportuntiesApiTarget> = MoyaProvider<OpportuntiesApiTarget>(plugins: [NetworkLoggerPlugin()])
    
    public static var shared: OpportuntiesManager = {
        let generalActions = OpportuntiesManager()
        return generalActions
        
    }()
    
    func fundType(completion: @escaping (Result<BaseResponse<FundType>, Error>) -> ()) {
        request(target: .fundType, completion: completion)
    }
    
    func getChannels(completion: @escaping (Result<BaseResponse<RecommendedChannel>, Error>) -> ()) {
        request(target: .getChannels, completion: completion)
    }
    
    func completeOpportunities(interest:String,id:Int,financialModel: [String], workType: String, levelOfDifficulty: String, AmountOfTechnology: String, amountRasise: String, opportuntiesUrl: String, competitorsUrl: [String], commomWays: [String], topAdvertisingChannel: [String], socialChannels: [String], avgAnnualRevenu: String, avgMonthlyCost: String, categories: [String],marketGraph: [String : String], completion: @escaping (Result<BaseResponse<Empty>, Error>) -> ()) {
        request(target: .completeOpportunities(id:id ,financialModel: financialModel, workType: workType, levelOfDifficulty: levelOfDifficulty, AmountOfTechnology: AmountOfTechnology, amountRasise: amountRasise, opportuntiesUrl: opportuntiesUrl, competitorsUrl: competitorsUrl, commomWays: commomWays, topAdvertisingChannel: topAdvertisingChannel, socialChannels: socialChannels, avgAnnualRevenu: avgAnnualRevenu, avgMonthlyCost: avgMonthlyCost, categories: categories, marketGraph: marketGraph,intrest:interest), completion: completion)
    }
    
    func opportunitiesDetails(id: String, completion: @escaping (Result<BaseResponse<opportunitiesDetails>, Error>) -> ()) {
        request(target: .opportunitiesDetails(id: id), completion: completion)

    }
    

    

}
