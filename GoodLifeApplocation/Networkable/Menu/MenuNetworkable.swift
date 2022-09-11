//
//  MenuNetworkable.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/08/2022.
//

import Foundation
import Moya


protocol MenuNetworkable:Networkable  {

    func volunteerOppourtinity(title:String,latitude:String,longitude:String,date:String,time:String,details:String,completion: @escaping (Result<BaseResponse<volunteerOppourtinity>, Error>)-> ())
    func createIdea(title:String,details:String,time_commitment:String,monthly_revenue:String,completion: @escaping (Result<BaseResponse<IdeaCreation>, Error>)-> ())
    func createFeedback(title:String,review:String,rate:String,img:Data,completion: @escaping (Result<BaseResponse<FeedbackCreation>, Error>)-> ())
    func getWorthyCauses(completion: @escaping (Result<BaseResponse<WorthyCauses>, Error>)-> ())
    func getSubWorthyCauses(worthycauseId:Int,completion: @escaping (Result<BaseResponse<SubWorthyCauses>, Error>)-> ())
    func makeDonation(worthycauseId:Int,amount:String,completion: @escaping (Result<BaseResponse<SubWorthyCauses>, Error>)-> ())
}

class MenuManager:MenuNetworkable{
 
   

   var provider: MoyaProvider<MenuApiTarget> = MoyaProvider<MenuApiTarget>(plugins: [NetworkLoggerPlugin()])
    
   public static var shared: MenuManager = {
       let generalActions = MenuManager()
       return generalActions
   }()
    
   typealias targetType = MenuApiTarget

    func volunteerOppourtinity(title: String, latitude: String, longitude: String, date: String, time: String, details: String, completion: @escaping (Result<BaseResponse<volunteerOppourtinity>, Error>) -> ()) {
        request(target: .VolunteerOppourtinity(title: title, latitude: latitude, longitude: longitude, date: date, time: time, details: details), completion: completion)
    }
    func createIdea(title: String, details: String, time_commitment: String, monthly_revenue: String, completion: @escaping (Result<BaseResponse<IdeaCreation>, Error>) -> ()) {
        request(target: .createIdea(title: title, details: details, time_commitment: time_commitment, monthly_revenue: monthly_revenue), completion: completion)
    }
    func createFeedback(title: String, review: String, rate: String, img: Data, completion: @escaping (Result<BaseResponse<FeedbackCreation>, Error>) -> ()) {
        request(target: .createFeedback(title: title, review: review, rate: rate, img: img), completion: completion)
    }
    func getWorthyCauses(completion: @escaping (Result<BaseResponse<WorthyCauses>, Error>) -> ()) {
        request(target: .getWorthyCauses, completion: completion)
    }
    func getSubWorthyCauses(worthycauseId: Int, completion: @escaping (Result<BaseResponse<SubWorthyCauses>, Error>) -> ()) {
        request(target: .getSubWorthyCauses(worthycauseId: worthycauseId), completion: completion)
    }
    
    func makeDonation(worthycauseId: Int, amount: String, completion: @escaping (Result<BaseResponse<SubWorthyCauses>, Error>) -> ()) {
        request(target: .makeDonation(worthycauseId: worthycauseId, amount: amount), completion: completion)
    }
   
    
}
