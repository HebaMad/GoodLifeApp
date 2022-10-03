//
//  HomeNetworkable.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 02/10/2022.
//

import Foundation
import Moya
protocol HomeNetworkable:Networkable  {

    func Home(txt:String,completion: @escaping (Result<BaseResponse<Home>, Error>)-> ())
    
}

class HomeManager:HomeNetworkable{

    
    typealias targetType = HomeApiTarget

    var provider: MoyaProvider<HomeApiTarget> = MoyaProvider<HomeApiTarget>(plugins: [NetworkLoggerPlugin()])
    
    public static var shared: HomeManager = {
        let generalActions = HomeManager()
        return generalActions
    }()
    
    func Home(txt: String, completion: @escaping (Result<BaseResponse<Home>, Error>) -> ()) {
        request(target: .Home(txt: txt), completion: completion)
    }

    
}
