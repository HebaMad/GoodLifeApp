//
//  SettingNetworkable.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/08/2022.
//

import Foundation
import Moya

protocol SettingNetworkable:Networkable  {

    func getUserProfile(completion: @escaping (Result<BaseResponse<userProfile>, Error>)-> ())
    func sendContactMsg(msg:String,completion: @escaping (Result<BaseResponse<contactUS>, Error>)-> ())
    func termsAndCondition(completion: @escaping (Result<BaseResponse<termsAndConditions>, Error>)-> ())
    func privacyPolicy(completion: @escaping (Result<BaseResponse<termsAndConditions>, Error>)-> ())
    func editProfile(name:String,mobileNumber:String,location:String,img:Data,completion: @escaping (Result<BaseResponse<userProfile>, Error>)-> ())
    func logout(completion: @escaping (Result<BaseResponse<userProfile>, Error>)-> ())
    func editVolunteerRequest(volunteerrequestId:String,title:String,location:String,date:String,time:String,details:String,completion: @escaping (Result<BaseResponse<VolunteerRequests>, Error>)-> ())
    func  editMinistryIdea(ministryIdeaID:String,title:String,details:String,time_commitment:String,monthly_revenue:String,fund_type_id:String,location:String,completion: @escaping (Result<BaseResponse<MinistryIdea>, Error>)-> ())
    func getVolunteerRequestData(volunteerrequestId:String,completion: @escaping (Result<BaseResponse<VolunteerRequests>, Error>)-> ())
    func  getMinistryIdeaData(ministryIdeaId:String,completion: @escaping (Result<BaseResponse<MinistryIdea>, Error>)-> ())
    
}
class SettingManager:SettingNetworkable{
 
   var provider: MoyaProvider<SettingApiTarget> = MoyaProvider<SettingApiTarget>(plugins: [NetworkLoggerPlugin()])
   public static var shared: SettingManager = {
       let generalActions = SettingManager()
       return generalActions
   }()
    
   typealias targetType = SettingApiTarget

    func getUserProfile(completion: @escaping (Result<BaseResponse<userProfile>, Error>) -> ()) {
        request(target: .userProfile, completion: completion)
    }

    func sendContactMsg(msg: String, completion: @escaping (Result<BaseResponse<contactUS>, Error>) -> ()) {
        request(target: .sendContactMsg(message: msg), completion: completion)
    }
    
    func termsAndCondition(completion: @escaping (Result<BaseResponse<termsAndConditions>, Error>) -> ()) {
        request(target: .termsAndConditions, completion: completion)
    }
    func privacyPolicy(completion: @escaping (Result<BaseResponse<termsAndConditions>, Error>) -> ()) {
        request(target: .privacyPolicy, completion: completion)
    }
    func editProfile(name: String, mobileNumber: String, location: String, img: Data, completion: @escaping (Result<BaseResponse<userProfile>, Error>) -> ()) {
        request(target: .editProfile(name: name, mobileNumber: mobileNumber, location: location, img: img), completion: completion)
    }
    

    func logout(completion: @escaping (Result<BaseResponse<userProfile>, Error>) -> ()) {
        request(target: .logout, completion: completion)
    }
    
    func editVolunteerRequest(volunteerrequestId: String, title: String, location: String, date: String, time: String, details: String, completion: @escaping (Result<BaseResponse<VolunteerRequests>, Error>) -> ()) {
        request(target: .updateVolunteerRequest(volunteerrequestId: volunteerrequestId, title: title, location: location, date: date, time: time, details: details), completion: completion)
    }
    func editMinistryIdea(ministryIdeaID: String, title: String, details: String, time_commitment: String, monthly_revenue: String, fund_type_id: String,location:String, completion: @escaping (Result<BaseResponse<MinistryIdea>, Error>) -> ()) {
        request(target: .updateMinistryIdea(ministryIdeaID: ministryIdeaID, title: title, details: details, time_commitment: time_commitment, monthly_revenue: monthly_revenue, fund_type_id: fund_type_id,location:location), completion: completion)
    }
    func getVolunteerRequestData(volunteerrequestId: String, completion: @escaping (Result<BaseResponse<VolunteerRequests>, Error>) -> ()) {
        request(target: .getVolunteerRequestData(volunteerrequestId:  volunteerrequestId), completion: completion)
    }
    
    func getMinistryIdeaData(ministryIdeaId: String, completion: @escaping (Result<BaseResponse<MinistryIdea>, Error>) -> ()) {
        request(target: .getMinistryIdeaData(ministryIdeaId: ministryIdeaId), completion: completion)
    }
    


  

}
