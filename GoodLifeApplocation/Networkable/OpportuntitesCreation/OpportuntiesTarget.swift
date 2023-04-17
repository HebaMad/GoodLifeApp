//
//  OpportuntiesTarget.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/04/2023.
//

import Foundation

import Moya
enum OpportuntiesApiTarget:TargetType{

    case fundType
    case getChannels

    
    var baseURL: URL {
        return URL(string: "\(AppConfig.apiBaseUrl)")!
    }
    
    var path: String {
        switch self {

        case .fundType:return "getFundTypes"
        case .getChannels:return "getChannels"
            
        }
    }
    
    
    var method: Moya.Method {
        switch self{
        case .fundType,.getChannels:
            return .get

        }
    }
    
    var task: Task{
        switch self{

        case .fundType,.getChannels:
            return .requestPlain

        }
    }
    
    
    var headers: [String : String]?{
        switch self{
        case .fundType,.getChannels:
            
            do {
                let token = try KeychainWrapper.get(key: AppData.mobile) ?? ""
                return ["Authorization":token ,"Accept":"application/json","Accept-Language":"en"]
            }
            catch{
                return ["Accept":"application/json","Accept-Language":"en"]
            }

  
            
        }
    }
    var param: [String : Any]{
        
        switch self {

        default : return [:]

            
        }
}

}
