//
//  MainTarget.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/03/2023.
//

import Foundation


import Foundation
import Moya
enum MainApiTarget:TargetType{
    case getNeedMainCategory
    case getNeedSubCategory
    case listOpportunities(search:String)
    case homescreen
    case deleteOpportunities(opportunity_id:String)
    
    
    var baseURL: URL {
        return URL(string: "\(AppConfig.apiBaseUrl)")!
    }
    
    var path: String {
        switch self {
            
        case .getNeedMainCategory:return "getNeedMainCategory"
        case .getNeedSubCategory:return "getNeedSubCategory"
        case .deleteOpportunities:return "deleteOpportunity"
        case .homescreen:return "homeScreen"
        case .listOpportunities:return "myOpportunities"
            
        }
    }
    
    
    var method: Moya.Method {
        switch self{
        case .homescreen,.listOpportunities,.getNeedMainCategory,.getNeedSubCategory:
            return .get
            
        case .deleteOpportunities:
            return .delete
            
        }
    }
    
    var task: Task{
        switch self{
        case .homescreen:
            return .requestPlain

        case .deleteOpportunities,.listOpportunities,.getNeedMainCategory,.getNeedSubCategory:
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)

        }
    }
    
    
    var headers: [String : String]?{
        switch self{
        case .homescreen,.deleteOpportunities,.listOpportunities:
            
            do {
                let token = try KeychainWrapper.get(key: AppData.mobile) ?? ""
                return ["Authorization":token ,"Accept":"application/json","Accept-Language":"en"]
            }
            catch{
                return ["Accept":"application/json","Accept-Language":"en"]
            }

        case .getNeedMainCategory,.getNeedSubCategory:
          return ["Accept":"application/json","Accept-Language":"en"]
            
        }
    }
    var param: [String : Any]{
        
        switch self {
            
        case .deleteOpportunities(let opportunity_id):
            return ["opportunity_id" :opportunity_id ]

        case .listOpportunities(let search):
            return ["search" :search ]

        default : return [:]

            
        }
}

}
