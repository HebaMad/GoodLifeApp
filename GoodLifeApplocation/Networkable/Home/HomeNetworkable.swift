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
    func MainCategory(completion: @escaping (Result<BaseResponse<MainHomeCategories>, Error>)-> ())
    func subCategory(completion: @escaping (Result<BaseResponse<SubHomeCategories>, Error>)-> ())
    func categoriesFiltering(mainCategoriesID:String,subCategoriesID:String,completion: @escaping (Result<BaseResponse<CategoriesFiltering>, Error>)-> ())
    func getOpportunities(needTypeId:Int,interestId:Int,completion: @escaping (Result<BaseResponse<Oppourtinity>, Error>)-> ())
    func oppourtinityDetails(opportunity_id:Int,completion: @escaping (Result<BaseResponse<packageDetails>, Error>)-> ())
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
    func MainCategory(completion: @escaping (Result<BaseResponse<MainHomeCategories>, Error>) -> ()) {
        request(target: .getNeedMainCategory, completion: completion)
    }
    func subCategory(completion: @escaping (Result<BaseResponse<SubHomeCategories>, Error>) -> ()) {
        request(target: .getNeedSubCategory, completion: completion)
    }
    func categoriesFiltering(mainCategoriesID: String, subCategoriesID: String, completion: @escaping (Result<BaseResponse<CategoriesFiltering>, Error>) -> ()) {
        request(target: .categoriesFiltering(mainCategoriesID: mainCategoriesID, subCategoriesID: subCategoriesID), completion: completion)
    }
    func getOpportunities(needTypeId: Int, interestId: Int, completion: @escaping (Result<BaseResponse<Oppourtinity>, Error>) -> ()) {

        request(target: .getOpportunities(needTypeId: needTypeId, intrest: interestId), completion: completion)
    }
    func oppourtinityDetails(opportunity_id: Int, completion: @escaping (Result<BaseResponse<packageDetails>, Error>) -> ()) {
        request(target: .oppourtinityDetails(opportunity_id: opportunity_id), completion: completion)
    }
    
}
