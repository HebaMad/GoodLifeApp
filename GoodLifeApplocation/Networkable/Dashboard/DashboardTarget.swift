//
//  DashboardTarget.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 31/08/2022.
//

import Foundation
import Moya


enum DashboardTarget:TargetType{
    
    case AddTask(title:String,category_id:Int,all_days:String,start_date:String,end_date:String)
    case AddGoal(title:String,category_id:Int,deadline:String)
    case categories
    case Resources
    case getMyTask
    case markMyTask(taskID:Int)
    case markMyGoal(goalID:Int)
    case getMyGoalsAndBenchmark(categoryID:Int)
    case resourceDetails(ResourceID:Int)
    
    var baseURL: URL {
        return URL(string: "\(AppConfig.apiBaseUrl)")!
    }
  
    var path: String {
        switch self {
        case .AddTask:return "createNewTask"
        case .AddGoal:return "createNewGoal"
        case .categories:return "getCategories"
        case .getMyTask:return "getMyTaskManager"
        case .Resources:return "getResources"
        case .markMyTask:return "markTaskCompleted"
        case .getMyGoalsAndBenchmark:return "getMyGoalsBenchmarks"
        case .resourceDetails:return "getResourcesScreen"
        case .markMyGoal:return "markGoalCompleted"
            
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .AddTask,.AddGoal,.markMyTask,.markMyGoal:
            return .post
       
        case .categories,.Resources,.getMyTask,.getMyGoalsAndBenchmark,.resourceDetails:
            return .get
        }
    }
    
    var task: Task{
        switch self{
            
        case .AddTask,.AddGoal,.markMyTask,.markMyGoal:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)
            
        case .categories,.Resources,.getMyTask:
            return .requestPlain
        case .resourceDetails,.getMyGoalsAndBenchmark:
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)

        }
    }
    
    
    var headers: [String : String]?{
        switch self{
        case .AddTask,.AddGoal,.getMyTask,.markMyTask,.getMyGoalsAndBenchmark,.markMyGoal,.resourceDetails,.Resources:
//            do {
//                let token = try KeychainWrapper.get(key: AppData.email) ?? ""
                return ["Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImI1OGE5YjU5Mzc1OTNiNDliODNlZjkzZGNjY2U4NGNmNTEyMzNiNTlkN2FmNjFlNDVlMzlhMzc5YTMzOGEwMGU3YmE1MWIwMTE5MjYzMTQ3In0.eyJhdWQiOiIxIiwianRpIjoiYjU4YTliNTkzNzU5M2I0OWI4M2VmOTNkY2NjZTg0Y2Y1MTIzM2I1OWQ3YWY2MWU0NWUzOWEzNzlhMzM4YTAwZTdiYTUxYjAxMTkyNjMxNDciLCJpYXQiOjE2NjExMTM5OTgsIm5iZiI6MTY2MTExMzk5OCwiZXhwIjoxNjkyNjQ5OTk4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ja_-fbFeKtwesbWM7JH3QgWNDKdB5pP0Qni_JfvCh3iIZdMDJj-KJAe_SLSD4-XehtdrZkksKsZm8dC0uhNAx1XMfMUlRxSlwrOVZe0SPkQrIO1t1x_yVAmlXO8no3pwMky4i59G7jxsxN5aC9dwlMGUogKMo49Y5khvzNVLKsz6EBBMOMpeOjhjlI81A3NluDIDpoBgUqqZgvStdxjfAFhk7Zuj2_4oB-FdbHFucjPX1RWqRm-XDe51oW-Ws0fzj-hQPawl9dqkcRqo9-cze5U_z6NlbGIbfEvjZOEZMa1J1_J5koFG1cw5bWY5Q8urtRgn4sTkMD6hmySjCuC8FSE3J0T1RhVYuBNo8V83AeaYeo6rp_htmitllbpjQ1rR-319g2AdYapahYYOBGpYMl-lzfeluMBlWStb9z4wDqOkRFw8x5q6z5LRBg4-lbn2x5IRhadhmcxgJW---kptWgcAoe85nDp1e4I7DaZClVb94kQUwLnaEXgt6_UVwBoEKzBXD0BgndS6jlMdlQa9VIcaD6bYddrJRq5eG9D5EfEsqrNQm_piDI6ewG8cAtRAPtAuME4quvqRTXEjtIPLK-6jsuWdHcXixRE3nrOTvl3Ge8pRrqFT7Z98OjmKFqcE5-sCOA03J9FfylcLY46g2XVNpgLmr-EfqcJtOyMp66g" ,"Accept":"application/json","Accept-Language":"en"]
//            }
//            catch{
//                return ["Accept":"application/json","Accept-Language":"en"]
//            }
  
        case .categories:
            return ["Accept":"application/json","Accept-Language":"en"]

        }
    }
    
    var param: [String : Any]{
        
        
        switch self {
 
        case .getMyGoalsAndBenchmark(let categoryID):
            return ["category_id":categoryID]
        case .resourceDetails(let ResourceID):
            return ["resource_id":ResourceID]
        case .markMyTask(let taskID):
            return ["task_id":taskID]
        case .markMyGoal(let goalID):
            return ["goal_id":goalID]
        case .AddGoal(let title,let category_id,let deadline):
            return ["title":title,"category_id":category_id,"deadline":deadline]

        case .AddTask(let title,let category_id,let all_days,let start_date,let end_date):
            return ["title":title,"category_id":category_id,"all_days":all_days,"start_date":start_date,"end_date":end_date]
            
        default : return [:]


        }
        
        
    }
}

