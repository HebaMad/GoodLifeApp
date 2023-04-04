//
//  MainTarget.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/03/2023.
//


import Foundation
import Moya
enum MainApiTarget:TargetType{
    case getNeedMainCategory
    case getNeedSubCategory
    case listOpportunities(search:String)
    case homescreen
    case deleteOpportunities(opportunity_id:String)
    case createOpportunties(title:String,city:String,state:String,description:String,name:String,tags:[String],rating:String,email:String,phone:String)
    
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
        case .createOpportunties: return "createOpportunity"
            
        }
    }
    
    
    var method: Moya.Method {
        switch self{
        case .homescreen,.listOpportunities,.getNeedMainCategory,.getNeedSubCategory:
            return .get
            
        case .deleteOpportunities:
            return .delete
            
            
        case .createOpportunties:
            return .post
        }
    }
    
    var task: Task{
        switch self{
        case .createOpportunties:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)

        case .homescreen:
            return .requestPlain

        case .deleteOpportunities,.listOpportunities,.getNeedMainCategory,.getNeedSubCategory:
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)

        }
    }
    
    
    var headers: [String : String]?{
        switch self{
        case .homescreen,.deleteOpportunities,.listOpportunities,.createOpportunties:
            
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
        case .createOpportunties(let title,let city,let state,let description,let name,let tags,let rating, let email,let phone):
            return ["title" :title,"city":city,"state":state,"description":description,"name":name,"tags":tags,"rating":rating,"email":email,"phone":phone ]
            
        case .deleteOpportunities(let opportunity_id):
            return ["opportunity_id" :opportunity_id ]

        case .listOpportunities(let search):
            return ["search" :search ]

        default : return [:]

            
        }
}

}
