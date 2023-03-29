//
//  MainNetworkable.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/03/2023.
//


import Foundation
import Moya
protocol MainNetworkable:Networkable  {

    func homescreen(completion: @escaping (Result<BaseResponse<MainScreenData>, Error>)-> ())
    func deleteOpportunities(opportunity_id:String,completion: @escaping (Result<BaseResponse<Empty>, Error>)-> ())
    func listOpportunities(search:String,completion: @escaping (Result<BaseResponse<ListOpportunities>, Error>)-> ())
}

class MainManager:MainNetworkable {
 
    

    typealias targetType = MainApiTarget

    var provider: MoyaProvider<MainApiTarget> = MoyaProvider<MainApiTarget>(plugins: [NetworkLoggerPlugin()])
    
    public static var shared: MainManager = {
        let generalActions = MainManager()
        return generalActions
        
    }()
    
    func homescreen(completion: @escaping (Result<BaseResponse<MainScreenData>, Error>) -> ()) {
        request(target: .homescreen, completion: completion)
    }
    func deleteOpportunities(opportunity_id: String, completion: @escaping (Result<BaseResponse<Empty>, Error>) -> ()) {
        request(target: .deleteOpportunities(opportunity_id: opportunity_id), completion: completion)
    }
 
    func listOpportunities(search: String, completion: @escaping (Result<BaseResponse<ListOpportunities>, Error>) -> ()) {
        request(target: .listOpportunities(search: search), completion: completion)
    }
    
   
}
