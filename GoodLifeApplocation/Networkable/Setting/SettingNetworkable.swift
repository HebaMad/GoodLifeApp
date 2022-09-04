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
    
    
}
