//
//  OpportuntiesNetworkable.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/04/2023.
//

import Foundation
import Moya
protocol OpportuntiesNetworkable:Networkable  {
    
    func fundType(completion: @escaping (Result<BaseResponse<FundType>, Error>)-> ())
    func getChannels(completion: @escaping (Result<BaseResponse<RecommendedChannel>, Error>)-> ())

}

class OpportuntiesManager:OpportuntiesNetworkable {
 
    typealias targetType = OpportuntiesApiTarget

    var provider: MoyaProvider<OpportuntiesApiTarget> = MoyaProvider<OpportuntiesApiTarget>(plugins: [NetworkLoggerPlugin()])
    
    public static var shared: OpportuntiesManager = {
        let generalActions = OpportuntiesManager()
        return generalActions
        
    }()
    
    func fundType(completion: @escaping (Result<BaseResponse<FundType>, Error>) -> ()) {
        request(target: .fundType, completion: completion)
    }
    
    func getChannels(completion: @escaping (Result<BaseResponse<RecommendedChannel>, Error>) -> ()) {
        request(target: .getChannels, completion: completion)
    }

}
