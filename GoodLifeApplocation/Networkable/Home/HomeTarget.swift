//
//  HomeTarget.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 02/10/2022.
//


import Foundation
import Moya
enum HomeApiTarget:TargetType{
    
    case Home(txt:String)
    case getNeedMainCategory
    case getNeedSubCategory
    case categoriesFiltering(mainCategoriesID:String,subCategoriesID:String)
    case getOpportunities(needTypeId:Int,intrest:Int)
    case oppourtinityDetails(opportunity_id:Int)
    case Filter(investmentFrom:String,investmentTo:String,work_type:String,level_of_difficulty:String,amount_of_technology:String)

    var baseURL: URL {
        return URL(string: "\(AppConfig.apiBaseUrl)")!
    }
    
    var path: String {
        switch self {
        case .Home:return "userHomeScreenFilter"
            
        case .getNeedMainCategory:return "getNeedMainCategory"
            
        case .getNeedSubCategory:return "getNeedSubCategory"
            
        case .categoriesFiltering:return "userHomeScreen"
            
        case .getOpportunities:return "getOpportunities"
            
        case .oppourtinityDetails:return "getOpportunityDetails"
            
        case .Filter:return "filterOpportunities"
            
        }
    }
    
    
    var method: Moya.Method {
        switch self{
        case .Home,.getNeedMainCategory,.getNeedSubCategory,.categoriesFiltering,.getOpportunities,.oppourtinityDetails,.Filter:
            return .get
            
        }
    }
    
    var task: Task{
        switch self{
            
        case .Home,.getNeedMainCategory,.getNeedSubCategory,.categoriesFiltering,.getOpportunities,.oppourtinityDetails,.Filter:
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        }
    }
    
    
    var headers: [String : String]?{
        switch self{
        case .Home,.categoriesFiltering,.getOpportunities,.oppourtinityDetails,.Filter:
            
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
            
        case .Home(let txt):
            return ["txt" :txt ]
            
        case .categoriesFiltering(let mainCategoriesID,let subCategoriesID):
            return ["main_category_id" : mainCategoriesID ,"sub_category_id":subCategoriesID]

        case .getOpportunities(let need_type_id ,let interest ):
            return ["need_type_id":need_type_id,"interest":interest]
        
        case .oppourtinityDetails(let opportunity_id):
            return ["opportunity_id":opportunity_id]
            
        case .Filter(let investmentFrom,let investmentTo,let work_type,let level_of_difficulty,let amount_of_technology):
            return ["desired_investment_from":investmentFrom,"desired_investment_to":investmentTo,"work_type":work_type,"level_of_difficulty":level_of_difficulty,"amount_of_technology":amount_of_technology]


        default : return [:]

            
        }
}

}
