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
    case getMyGoalsAndBenchmark(categoryID:Int)
    case resourceDetails(categoryID:Int)
    
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
            
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .AddTask,.AddGoal,.markMyTask:
            return .post
       
        case .categories,.Resources,.getMyTask,.getMyGoalsAndBenchmark,.resourceDetails:
            return .get
        }
    }
    
    var task: Task{
        switch self{
            
        case .AddTask,.AddGoal,.markMyTask:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)
            
        case .categories,.Resources,.getMyTask:
            return .requestPlain
        case .resourceDetails,.getMyGoalsAndBenchmark:
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)

        }
    }
    
    
    var headers: [String : String]?{
        switch self{
        case .AddTask,.AddGoal,.getMyTask,.markMyTask,.getMyGoalsAndBenchmark:
//            do {
//                let token = try KeychainWrapper.get(key: AppData.email) ?? ""
                return ["Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImYxOGQ3YmY1OWQ1MTA5YmMzZDdmNTdjNjVjMTA0ZjMyNTkyNzYyNjZlMWFhNjMxNTMyODM0ZDM5NGM5NTlmNGRjZTNhNjNkYThiYmU4ZTczIn0.eyJhdWQiOiIxIiwianRpIjoiZjE4ZDdiZjU5ZDUxMDliYzNkN2Y1N2M2NWMxMDRmMzI1OTI3NjI2NmUxYWE2MzE1MzI4MzRkMzk0Yzk1OWY0ZGNlM2E2M2RhOGJiZThlNzMiLCJpYXQiOjE2NjIzMDY2MzYsIm5iZiI6MTY2MjMwNjYzNiwiZXhwIjoxNjkzODQyNjM2LCJzdWIiOiIyOCIsInNjb3BlcyI6W119.rtnkLw0dViiNlq2aAOAcngyHzeN0x-KElkwk4QP2SNBfvRQ4CQ_8oLCKJjMBv2rBARBHcrhJP4d71eYc_ilzeYj-MIx16eDoA3XnAlYhG_updsxL9WO3Kpze8UlJnjR5m1lrKwQ1bpeFnVWNNYw3vJkUr3U5lXVhzoPIE08tcaz_agXeN4kmkNht5BtSwed5Rv9BU-Z3DGInEPG5P3dDK94ssLAA-im9FrfewURIyRZUcZBHzbOzno6PkY2p6IbYkEWLRY5Ps3tPvn_feJcsZLhl0QhQXs28N4ayFs3V99MPhfJ9XuO4oDOknGHriPAFoZ_SAE2eewqQJ6oVJ_wJHk9VCDRnLtgMhLOGn3jlVDnQMahi2bsnQjKRslPnEgGnIno2kpzgC5EbPtZiujU1P6CnMYX9gPRtelIG0ChqCUFax5sKw-aMTwH0pAnXg_wCqTKgWo5Rkwsw-48e7O3hgOdtwQhghohF65by1Y00ATqqdSnsc4o2CgU7t11MscyA6OqSFkSGj3MjX3n-3zZ-XIwh_hdtnUHTpYkxVhu85rUi6ZFcfKp6jy6m1IREiJ2aXljt6PKucIfmSal-q55UrITHOEYoLVeJzt8YTDXCoIDkp2GPBnrO5bXWH2zcH8oygb0kx0e-TWhNhN1_7Uz-n1-Si1NkwW6CDada7nVHdPA" ,"Accept":"application/json","Accept-Language":"en"]
//            }
//            catch{
//                return ["Accept":"application/json","Accept-Language":"en"]
//            }
  
        case .categories,.Resources,.resourceDetails:
            return ["Accept":"application/json","Accept-Language":"en"]

        }
    }
    
    var param: [String : Any]{
        
        
        switch self {
 
        case .getMyGoalsAndBenchmark(let categoryID):
            return ["category_id":categoryID]
        case .resourceDetails(let categoryID):
            return ["resource_id":categoryID]
        case .markMyTask(let taskID):
            return ["task_id":taskID]
        case .AddGoal(let title,let category_id,let deadline):
            return ["title":title,"category_id":category_id,"deadline":deadline]

        case .AddTask(let title,let category_id,let all_days,let start_date,let end_date):
            return ["title":title,"category_id":category_id,"all_days":all_days,"start_date":start_date,"end_date":end_date]
            
        default : return [:]


        }
        
        
    }
}

