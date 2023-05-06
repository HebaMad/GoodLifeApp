//
//  HomeTarget.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 02/10/2022.
//


import Foundation
import Moya
enum HomeApiTarget:TargetType{
    
    case Home
    case categoriesFiltering(mainCategoriesID:String,subCategoriesID:String,latitude:String,longitude:String,city:String)
    case getOpportunities(needTypeId:Int,intrest:Int)
    case oppourtinityDetails(opportunity_id:Int)
    case Filter(investmentFrom:String,investmentTo:String,work_type:String,level_of_difficulty:String,amount_of_technology:String)
    case AddFundType(name:String,main_category_id:String,sub_category_id:String,latitude:String,longitude:String,city:String,default_need:String)
    
    case homescreen
    var baseURL: URL {
        return URL(string: "\(AppConfig.apiBaseUrl)")!
    }
    
    var path: String {
        switch self {
            
        case .Home:return "userHomeScreen"
            
        case .categoriesFiltering:return "userHomeScreen"
            
        case .getOpportunities:return "getOpportunities"
            
        case .oppourtinityDetails:return "getOpportunityDetails"
            
        case .Filter:return "filterOpportunities"
            
        case .AddFundType:return "createFundType"

        case .homescreen:return "homeScreen"
            
        }
    }
    
    
    var method: Moya.Method {
        switch self{
        case .Home,.categoriesFiltering,.getOpportunities,.oppourtinityDetails,.Filter,.homescreen:
            return .get
            
        case .AddFundType:
            return .post
            
        }
    }
    
    var task: Task{
        switch self{
        case .homescreen,.Home:
            return .requestPlain
        case .AddFundType:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)

        case .categoriesFiltering,.getOpportunities,.oppourtinityDetails,.Filter:
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        }
    }
    
    
    var headers: [String : String]?{
        switch self{
        case .Home,.categoriesFiltering,.getOpportunities,.oppourtinityDetails,.Filter,.AddFundType,.homescreen:
            
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
            
 
            
        case .categoriesFiltering(let mainCategoriesID,let subCategoriesID,let latitude,let longitude,let city):
            return ["main_category_id" : mainCategoriesID ,"sub_category_id":subCategoriesID,"latitude":latitude,"longitude":longitude,"city":city]

        case .getOpportunities(let need_type_id ,let interest ):
            return ["need_type_id":need_type_id,"interest":interest]
        
        case .oppourtinityDetails(let opportunity_id):
            return ["opportunity_id":opportunity_id]
            
        case .Filter(let investmentFrom,let investmentTo,let work_type,let level_of_difficulty,let amount_of_technology):
            return ["desired_investment_from":investmentFrom,"desired_investment_to":investmentTo,"work_type":work_type,"level_of_difficulty":level_of_difficulty,"amount_of_technology":amount_of_technology]

        case .AddFundType( let name,let main_category_id,let sub_category_id,let latitude, let longitude,let city, let default_need):
            return ["name":name,"main_category_id":main_category_id,"sub_category_id":sub_category_id,"latitude":latitude,"longitude":longitude,"city":city,"default_need":default_need]
            
        default : return [:]

            
        }
}

}
