//
//  SignUserNetworkable.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 28/08/2022.
//

import Foundation
import Moya
protocol SignUserNetworkable:Networkable  {

    func signUpUser(mobile:String,completion: @escaping (Result<BaseResponse<userProfile>, Error>)-> ())
    func resendCode(mobile:String,completion: @escaping (Result<BaseResponse<startFundRaise>, Error>)-> ())
    func checkCode(mobile:String,code:String,completion: @escaping (Result<BaseResponse<userProfile>, Error>)-> ())
    func startFundRaise(latitude:String,longitude:String,work_type:String,amount_raise:Float,completion: @escaping (Result<BaseResponse<startFundRaise>, Error>)-> ())
    func login(mobile:String,token:String,completion: @escaping (Result<BaseResponse<userProfile>, Error>)-> ())
    
    
}
class SignUserManager:SignUserNetworkable{

 
    typealias targetType = SignUserTarget

    var provider: MoyaProvider<SignUserTarget> = MoyaProvider<SignUserTarget>(plugins: [NetworkLoggerPlugin()])
    
    public static var shared: SignUserManager = {
        let generalActions = SignUserManager()
        return generalActions
    }()
    
    func signUpUser(mobile: String,completion: @escaping (Result<BaseResponse<userProfile>, Error>)-> ()) {
        request(target: .SignUp(mobile: mobile), completion: completion)
    }
    func resendCode(mobile: String, completion: @escaping (Result<BaseResponse<startFundRaise>, Error>) -> ()) {
        request(target: .resendCode(mobile: mobile), completion: completion)
    }
    
    func checkCode(mobile: String, code: String, completion: @escaping (Result<BaseResponse<userProfile>, Error>) -> ()) {
        request(target: .checkCode(mobile: mobile, code: code), completion: completion)
    }
    
    func startFundRaise(latitude: String, longitude: String, work_type: String, amount_raise: Float, completion: @escaping (Result<BaseResponse<startFundRaise>, Error>) -> ()) {
        request(target: .startFundRaise(latitude: latitude, longitude: longitude, work_type: work_type, amount_raise: amount_raise), completion: completion)
    }
    func login(mobile: String,token:String ,completion: @escaping (Result<BaseResponse<userProfile>, Error>) -> ()) {
        request(target: .login(mobile: mobile,token: token), completion: completion)
    }
    


    
}
