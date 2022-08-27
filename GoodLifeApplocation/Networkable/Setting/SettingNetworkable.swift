//
//  SettingNetworkable.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/08/2022.
//

import Foundation
import Moya

protocol SettingNetworkable:Networkable  {

    func getUserProfile(completion: @escaping (Result<BaseResponse<Empty>, Error>)-> ())
    func sendContactMsg(msg:String,completion: @escaping (Result<BaseResponse<Empty>, Error>)-> ())
    func termsAndCondition(completion: @escaping (Result<BaseResponse<Empty>, Error>)-> ())
    func privacyPolicy(completion: @escaping (Result<BaseResponse<Empty>, Error>)-> ())
    func editProfile(name:String,mobile:String,completion: @escaping (Result<BaseResponse<Empty>, Error>)-> ())
}
class SettingManager:SettingNetworkable{
  
   var provider: MoyaProvider<SettingApiTarget> = MoyaProvider<SettingApiTarget>(plugins: [NetworkLoggerPlugin()])
   public static var shared: SettingManager = {
       let generalActions = SettingManager()
       return generalActions
   }()
    
   typealias targetType = SettingApiTarget

    func getUserProfile(completion: @escaping (Result<BaseResponse<Empty>, Error>) -> ()) {
        request(target: .userProfile, completion: completion)
    }

    func sendContactMsg(msg: String, completion: @escaping (Result<BaseResponse<Empty>, Error>) -> ()) {
        request(target: .sendContactMsg(message: msg), completion: completion)
    }
    
    func termsAndCondition(completion: @escaping (Result<BaseResponse<Empty>, Error>) -> ()) {
        request(target: .termsAndConditions, completion: completion)
    }
    func privacyPolicy(completion: @escaping (Result<BaseResponse<Empty>, Error>) -> ()) {
        request(target: .privacyPolicy, completion: completion)
    }
    func editProfile(name: String, mobile: String, completion: @escaping (Result<BaseResponse<Empty>, Error>) -> ()) {
        request(target: .editProfile(name: name, mobileNumber: mobile, location: mobile), completion: completion)
    }
    
}
