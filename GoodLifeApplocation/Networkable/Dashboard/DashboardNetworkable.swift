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
    func AddGoal(title:String,category_id:Int,deadline:String,url:String,completion: @escaping (Result<BaseResponse<goalCreation>, Error>)-> ())
    func getCategories(opportunity_id:Int,completion: @escaping (Result<BaseResponse<DahboardCategory>, Error>)-> ())
    func getResource(completion: @escaping (Result<BaseResponse<DashboardResource>, Error>)-> ())
    func getMyTask(completion: @escaping (Result<BaseResponse<DashboardTask>, Error>)-> ())
    func markMyTask(taskID:Int,completion: @escaping (Result<BaseResponse<Tasks>, Error>)-> ())
    func getMyGoalsAndBenchmarks(categoryID:Int,completion: @escaping (Result<BaseResponse<GoalsAndBenchmark>, Error>)-> ())
    func resourceDetails(ResourceID:Int,completion: @escaping (Result<BaseResponse<ResourceDetails>, Error>)-> ())
    func markMyGoal(goalID:Int,completion: @escaping (Result<BaseResponse<Tasks>, Error>)-> ())
    func notification(completion: @escaping (Result<BaseResponse<AllNotifiaction>, Error>)-> ())
    
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

    func AddGoal(title: String, category_id: Int, deadline: String,url:String, completion: @escaping (Result<BaseResponse<goalCreation>, Error>) -> ()) {
        request(target: .AddGoal(title: title, category_id: category_id, deadline: deadline,url:url), completion: completion)
    }
    
    func getCategories(opportunity_id:Int,completion: @escaping (Result<BaseResponse<DahboardCategory>, Error>) -> ()) {
        request(target: .categories(opportunity_id: opportunity_id), completion: completion)
    }
    
    func getResource(completion: @escaping (Result<BaseResponse<DashboardResource>, Error>) -> ()) {
        request(target: .Resources, completion: completion)
    }
    func getMyTask(completion: @escaping (Result<BaseResponse<DashboardTask>, Error>) -> ()) {
        request(target: .getMyTask, completion: completion)
    }
    func markMyTask(taskID: Int, completion: @escaping (Result<BaseResponse<Tasks>, Error>) -> ()) {
        request(target: .markMyTask(taskID: taskID), completion: completion)
    }
    func getMyGoalsAndBenchmarks(categoryID:Int,completion: @escaping (Result<BaseResponse<GoalsAndBenchmark>, Error>) -> ()) {
        request(target: .getMyGoalsAndBenchmark(categoryID: categoryID), completion: completion)
    }
    
    func resourceDetails(ResourceID: Int, completion: @escaping (Result<BaseResponse<ResourceDetails>, Error>) -> ()) {
        request(target: .resourceDetails(ResourceID: ResourceID), completion: completion)
    }
    func markMyGoal(goalID: Int, completion: @escaping (Result<BaseResponse<Tasks>, Error>) -> ()) {
        request(target: .markMyGoal(goalID: goalID), completion: completion)
    }
    
    func notification(completion: @escaping (Result<BaseResponse<AllNotifiaction>, Error>) -> ()) {
        request(target: .notification, completion: completion)
    }
    
}
