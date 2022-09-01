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
            
        }
    }
    var method: Moya.Method {
        switch self{
        case .AddTask,.AddGoal:
            return .post
       
        case .categories,.Resources,.getMyTask:
            return .get
        }
    }
    
    var task: Task{
        switch self{
            
        case .AddTask,.AddGoal:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)
        case .categories,.Resources,.getMyTask:
            return .requestPlain
        }
    }
    
    
    var headers: [String : String]?{
        switch self{
        case .AddTask,.AddGoal,.getMyTask:
//            do {
//                let token = try KeychainWrapper.get(key: AppData.email) ?? ""
                return ["Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijc1NzFjZWI3NjUyNmQ0MjdkODRhMGExZmQzOWU3YTE0NTVjNWI4MmM2OTFiNTViOWQ4NTIyNmYzZjUxOTVhMTU0NzdmNjdkYzY0Njk5MWU3In0.eyJhdWQiOiIxIiwianRpIjoiNzU3MWNlYjc2NTI2ZDQyN2Q4NGEwYTFmZDM5ZTdhMTQ1NWM1YjgyYzY5MWI1NWI5ZDg1MjI2ZjNmNTE5NWExNTQ3N2Y2N2RjNjQ2OTkxZTciLCJpYXQiOjE2NjE5NDA2NjAsIm5iZiI6MTY2MTk0MDY2MCwiZXhwIjoxNjkzNDc2NjYwLCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.M5WQx9pm9QplzaQnUpP96QP89EzXYC9_zq_wQgMICmH37SGmq1Q-FPEtzJHRGc79nufER5vd_TIOFAAY9kA6CN1_xhe1Wxl5AnN8kFEp_2PKuvtsh2Ie8WoaUcFEFup9pVLmlYGKhAsAG5v4iChzsDlKWsOkuv9DE8VBoPTyXBjbmKavoMIMzgzK1qKrG5N1CpkRdladslsWvMSa6K_JwI5FnFqCa4eWjPpGavV9LbS2imWs0evUvUvN9RTp6b4GFERJAaHBxwClsxtRKHwX6XGIOhj95BS27SeMm_NbD8pWJ9t4ORtf5Mo7YmEgSLNPhRM5JybSHEXWCUIlZKHmS-YXoPxsNdE664l8ESlLHE05XYXV7B0O8jKpRjm7Szu5teCukzqrlzpFsQDVFHt6jiDZe2NJ_fyXIBbEi25_nnaN7Z6AXLmvNH1KbSCj7pua3Cg9_jewgnXbHxuB-U01vF1KeZY8aKofO7K2u8ILLrnMGuexdnAPrevvVa6F13-y7r_IFDRonX7twe0LEsd1QpAJ3VdyzJcqfJqsbRkcfqyeYeBc3ZNIAuqxwOwxf3mNzsr2Mm_tKJ6sWf9OSzqxNJfeXwfJVXARj8mU4dTqVtgWAZamGE6bB7HIKfEQFlTHTibjd3-KcorCuWvWIJjp66BcqgvS2zyYh3UJLlJKCmQ" ,"Accept":"application/json","Accept-Language":"en"]
//            }
//            catch{
//                return ["Accept":"application/json","Accept-Language":"en"]
//            }
  
        case .categories,.Resources:
            return ["Accept":"application/json","Accept-Language":"en"]

        }
    }
    
    var param: [String : Any]{
        
        
        switch self {
 
        case .AddGoal(let title,let category_id,let deadline):
            return ["title":title,"category_id":category_id,"deadline":deadline]

        case .AddTask(let title,let category_id,let all_days,let start_date,let end_date):
            return ["title":title,"category_id":category_id,"all_days":all_days,"start_date":start_date,"end_date":end_date]
            
        default : return [:]


        }
        
        
    }
}

