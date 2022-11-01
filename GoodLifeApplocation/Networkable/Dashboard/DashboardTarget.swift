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
    case AddGoal(title:String,category_id:Int,deadline:String,url:String)
    case categories
    case Resources
    case getMyTask
    case markMyTask(taskID:Int)
    case markMyGoal(goalID:Int)
    case getMyGoalsAndBenchmark(categoryID:Int)
    case resourceDetails(ResourceID:Int)
    case notification

    
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
        case .notification:return "getMyNotifications"

        }
    }
    
    var method: Moya.Method {
        switch self{
        case .AddTask,.AddGoal,.markMyTask,.markMyGoal:
            return .post
       
        case .categories,.Resources,.getMyTask,.getMyGoalsAndBenchmark,.resourceDetails,.notification:
            return .get
        }
    }
    
    var task: Task{
        switch self{
            
        case .AddTask,.AddGoal,.markMyTask,.markMyGoal:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)
            
        case .categories,.Resources,.getMyTask,.notification:
            return .requestPlain
        case .resourceDetails,.getMyGoalsAndBenchmark:
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)

        }
    }
    
    
    var headers: [String : String]?{
        switch self{
        case .AddTask,.AddGoal,.getMyTask,.markMyTask,.getMyGoalsAndBenchmark,.markMyGoal,.resourceDetails,.Resources,.notification,.categories:
            
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
 
        case .getMyGoalsAndBenchmark(let categoryID):
            return ["category_id":categoryID]
        case .resourceDetails(let ResourceID):
            return ["resource_id":ResourceID]
        case .markMyTask(let taskID):
            return ["task_id":taskID]
        case .markMyGoal(let goalID):
            return ["goal_id":goalID]
        case .AddGoal(let title,let category_id,let deadline,let url):
            return ["title":title,"category_id":category_id,"deadline":deadline,"url":url]

        case .AddTask(let title,let category_id,let all_days,let start_date,let end_date):
            return ["title":title,"category_id":category_id,"all_days":all_days,"start_date":start_date,"end_date":end_date]
            
        default : return [:]


        }
        
        
    }
}

