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
            //            do {
            //                let token = try KeychainWrapper.get(key: AppData.email) ?? ""
            return ["Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImI1OGE5YjU5Mzc1OTNiNDliODNlZjkzZGNjY2U4NGNmNTEyMzNiNTlkN2FmNjFlNDVlMzlhMzc5YTMzOGEwMGU3YmE1MWIwMTE5MjYzMTQ3In0.eyJhdWQiOiIxIiwianRpIjoiYjU4YTliNTkzNzU5M2I0OWI4M2VmOTNkY2NjZTg0Y2Y1MTIzM2I1OWQ3YWY2MWU0NWUzOWEzNzlhMzM4YTAwZTdiYTUxYjAxMTkyNjMxNDciLCJpYXQiOjE2NjExMTM5OTgsIm5iZiI6MTY2MTExMzk5OCwiZXhwIjoxNjkyNjQ5OTk4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ja_-fbFeKtwesbWM7JH3QgWNDKdB5pP0Qni_JfvCh3iIZdMDJj-KJAe_SLSD4-XehtdrZkksKsZm8dC0uhNAx1XMfMUlRxSlwrOVZe0SPkQrIO1t1x_yVAmlXO8no3pwMky4i59G7jxsxN5aC9dwlMGUogKMo49Y5khvzNVLKsz6EBBMOMpeOjhjlI81A3NluDIDpoBgUqqZgvStdxjfAFhk7Zuj2_4oB-FdbHFucjPX1RWqRm-XDe51oW-Ws0fzj-hQPawl9dqkcRqo9-cze5U_z6NlbGIbfEvjZOEZMa1J1_J5koFG1cw5bWY5Q8urtRgn4sTkMD6hmySjCuC8FSE3J0T1RhVYuBNo8V83AeaYeo6rp_htmitllbpjQ1rR-319g2AdYapahYYOBGpYMl-lzfeluMBlWStb9z4wDqOkRFw8x5q6z5LRBg4-lbn2x5IRhadhmcxgJW---kptWgcAoe85nDp1e4I7DaZClVb94kQUwLnaEXgt6_UVwBoEKzBXD0BgndS6jlMdlQa9VIcaD6bYddrJRq5eG9D5EfEsqrNQm_piDI6ewG8cAtRAPtAuME4quvqRTXEjtIPLK-6jsuWdHcXixRE3nrOTvl3Ge8pRrqFT7Z98OjmKFqcE5-sCOA03J9FfylcLY46g2XVNpgLmr-EfqcJtOyMp66g" ,"Accept":"application/json","Accept-Language":"en"]
            //            }
            //            catch{
            //                return ["Accept":"application/json","Accept-Language":"en"]
            //            }
            
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
