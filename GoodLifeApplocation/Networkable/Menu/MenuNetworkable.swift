//
//  MenuNetworkable.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/08/2022.
//

import Foundation
import Moya


protocol MenuNetworkable:Networkable  {

    func volunteerOppourtinity(title:String,latitude:String,longitude:String,date:String,time:String,details:String,completion: @escaping (Result<BaseResponse<Empty>, Error>)-> ())
    func createIdea(title:String,details:String,time_commitment:String,monthly_revenue:String,completion: @escaping (Result<BaseResponse<Empty>, Error>)-> ())
}

class MenuManager:MenuNetworkable{
 
   var provider: MoyaProvider<MenuApiTarget> = MoyaProvider<MenuApiTarget>(plugins: [NetworkLoggerPlugin()])
   public static var shared: MenuManager = {
       let generalActions = MenuManager()
       return generalActions
   }()
    
   typealias targetType = MenuApiTarget

    func volunteerOppourtinity(title: String, latitude: String, longitude: String, date: String, time: String, details: String, completion: @escaping (Result<BaseResponse<Empty>, Error>) -> ()) {
        request(target: .VolunteerOppourtinity(title: title, latitude: latitude, longitude: longitude, date: date, time: time, details: details), completion: completion)
    }
    func createIdea(title: String, details: String, time_commitment: String, monthly_revenue: String, completion: @escaping (Result<BaseResponse<Empty>, Error>) -> ()) {
        request(target: .createIdea(title: title, details: details, time_commitment: time_commitment, monthly_revenue: monthly_revenue), completion: completion)
    }
    
}
