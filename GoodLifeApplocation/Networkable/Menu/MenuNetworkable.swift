//
//  MenuNetworkable.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/08/2022.
//

import Foundation
import Moya


protocol MenuNetworkable:Networkable  {

    func volunteerOppourtinity(title:String,location:String,date:String,time:String,details:String,completion: @escaping (Result<BaseResponse<volunteerOppourtinity>, Error>)-> ())
    func createIdea(title:String,details:String,time_commitment:String,monthly_revenue:String,fund_type_id:String,location:String,completion: @escaping (Result<BaseResponse<IdeaCreation>, Error>)-> ())
    func createFeedback(id:String,review:String,ratings:[String:String],completion: @escaping (Result<BaseResponse<FeedbackCreation>, Error>)-> ())
    func getWorthyCauses(completion: @escaping (Result<BaseResponse<WorthyCauses>, Error>)-> ())
    func getSubWorthyCauses(worthycauseId:Int,completion: @escaping (Result<BaseResponse<SubWorthyCauses>, Error>)-> ())
    func makeDonation(worthycauseId:Int,amount:String,completion: @escaping (Result<BaseResponse<SubWorthyCauses>, Error>)-> ())
    func fundType(completion: @escaping (Result<BaseResponse<FundType>, Error>)-> ())
    func stewardingMyResourse(completion: @escaping (Result<BaseResponse<StewardingMyResource>, Error>)-> ())
    func updateStewardingTime(timePerHour:String,timePerMonth:String,completion: @escaping (Result<BaseResponse<userProfile>, Error>)-> ())
    func  updateAvailableSupportMoney(availableSupport:String,completion: @escaping (Result<BaseResponse<userProfile>, Error>)-> ())
    func updateTalent(talent:[String],completion: @escaping (Result<BaseResponse<userProfile>, Error>)-> ())
    func updateInterest(intrest:[String],completion: @escaping (Result<BaseResponse<userProfile>, Error>)-> ())
    func getFundType(opportunitiesid:String,completion: @escaping (Result<BaseResponse<FundTyps>, Error>)-> ())

}

class MenuManager:MenuNetworkable{


   var provider: MoyaProvider<MenuApiTarget> = MoyaProvider<MenuApiTarget>(plugins: [NetworkLoggerPlugin()])
    
   public static var shared: MenuManager = {
       let generalActions = MenuManager()
       return generalActions
   }()
    
   typealias targetType = MenuApiTarget

    func volunteerOppourtinity(title: String,location:String, date: String, time: String, details: String, completion: @escaping (Result<BaseResponse<volunteerOppourtinity>, Error>) -> ()) {
        request(target: .VolunteerOppourtinity(title: title,location: location, date: date, time: time, details: details), completion: completion)
    }
    func createIdea(title: String, details: String, time_commitment: String, monthly_revenue: String,fund_type_id:String,location:String, completion: @escaping (Result<BaseResponse<IdeaCreation>, Error>) -> ()) {
        request(target: .createIdea(title: title, details: details, time_commitment: time_commitment, monthly_revenue: monthly_revenue,fund_type_id:fund_type_id,location:location), completion: completion)
    }
    func createFeedback(id: String, review: String,ratings:[String:String], completion: @escaping (Result<BaseResponse<FeedbackCreation>, Error>) -> ()) {
        request(target: .createFeedback(opportunity_id: id, review: review,ratings:ratings), completion: completion)
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
    func fundType(completion: @escaping (Result<BaseResponse<FundType>, Error>) -> ()) {
        request(target: .FundType, completion: completion)
    }
    
    func stewardingMyResourse(completion: @escaping (Result<BaseResponse<StewardingMyResource>, Error>) -> ()) {
        request(target: .stewardingMyResourse, completion: completion)
    }
    func updateStewardingTime(timePerHour: String, timePerMonth: String, completion: @escaping (Result<BaseResponse<userProfile>, Error>) -> ()) {
        request(target: .updateStewardingTime(timePerHour: timePerHour, timePerMonth: timePerMonth), completion: completion)
    }
    func updateAvailableSupportMoney(availableSupport: String, completion: @escaping (Result<BaseResponse<userProfile>, Error>) -> ()) {
        request(target: .updateAvailableSupportMoney(availableSupport: availableSupport), completion: completion)
    }
    
    func updateTalent(talent: [String], completion: @escaping (Result<BaseResponse<userProfile>, Error>) -> ()) {
        request(target: .updateTalent(talent: talent), completion: completion)
    }
    
    func updateInterest(intrest: [String], completion: @escaping (Result<BaseResponse<userProfile>, Error>) -> ()) {
        request(target: .updateInterest(intrest: intrest), completion: completion)
    }
    
    func getFundType(opportunitiesid: String, completion: @escaping (Result<BaseResponse<FundTyps>, Error>) -> ()) {
        request(target: .getFundType(opportunitiesid: opportunitiesid), completion: completion)
    }
     
 
}
