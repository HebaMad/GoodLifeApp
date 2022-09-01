//
//  DashboardNetworkable.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 31/08/2022.
//

import Foundation
import Moya

protocol DashboardNetworkable:Networkable  {

    func AddTask(title:String,category_id:Int,all_days:String,start_date:String,end_date:String,completion: @escaping (Result<BaseResponse<userProfile>, Error>)-> ())
    func AddGoal(title:String,category_id:Int,deadline:String,completion: @escaping (Result<BaseResponse<goalCreation>, Error>)-> ())
    func getCategories(completion: @escaping (Result<BaseResponse<DahboardCategory>, Error>)-> ())
    func getResource(completion: @escaping (Result<BaseResponse<DashboardResource>, Error>)-> ())
    func getMyTask(completion: @escaping (Result<BaseResponse<DashboardTask>, Error>)-> ())
}

class DashboardManager:DashboardNetworkable{
   
 
    typealias targetType = DashboardTarget

    var provider: MoyaProvider<DashboardTarget> = MoyaProvider<DashboardTarget>(plugins: [NetworkLoggerPlugin()])
    
    public static var shared: DashboardManager = {
        let generalActions = DashboardManager()
        return generalActions
    }()

    
    func AddTask(title: String, category_id: Int, all_days: String, start_date: String, end_date: String,completion: @escaping (Result<BaseResponse<userProfile>, Error>)-> ()) {
        request(target: .AddTask(title: title, category_id: category_id, all_days: all_days, start_date: start_date, end_date: end_date), completion:completion )
    }

    func AddGoal(title: String, category_id: Int, deadline: String, completion: @escaping (Result<BaseResponse<goalCreation>, Error>) -> ()) {
        request(target: .AddGoal(title: title, category_id: category_id, deadline: deadline), completion: completion)
    }
    
    func getCategories(completion: @escaping (Result<BaseResponse<DahboardCategory>, Error>) -> ()) {
        request(target: .categories, completion: completion)
    }
    
    func getResource(completion: @escaping (Result<BaseResponse<DashboardResource>, Error>) -> ()) {
        request(target: .Resources, completion: completion)
    }
    func getMyTask(completion: @escaping (Result<BaseResponse<DashboardTask>, Error>) -> ()) {
        request(target: .getMyTask, completion: completion)
    }
    



    

}
