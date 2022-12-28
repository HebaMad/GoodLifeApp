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
    func categoriesFiltering(mainCategoriesID:String,subCategoriesID:String,latitude:String,longitude:String,city:String,completion: @escaping (Result<BaseResponse<CategoriesFiltering>, Error>)-> ())
    func getOpportunities(needTypeId:Int,interestId:Int,completion: @escaping (Result<BaseResponse<Oppourtinity>, Error>)-> ())
    func oppourtinityDetails(opportunity_id:Int,completion: @escaping (Result<BaseResponse<OppourtinityDetails>, Error>)-> ())
    func Filter(investmentFrom:String,investmentTo:String,work_type:String,level_of_difficulty:String,amount_of_technology:String,completion: @escaping (Result<BaseResponse<Oppourtinity>, Error>)-> ())
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
    func categoriesFiltering(mainCategoriesID: String, subCategoriesID: String,latitude:String,longitude:String,city:String, completion: @escaping (Result<BaseResponse<CategoriesFiltering>, Error>) -> ()) {
        request(target: .categoriesFiltering(mainCategoriesID: mainCategoriesID, subCategoriesID: subCategoriesID,latitude:latitude,longitude:longitude,city:city), completion: completion)
    }
    func getOpportunities(needTypeId: Int, interestId: Int, completion: @escaping (Result<BaseResponse<Oppourtinity>, Error>) -> ()) {

        request(target: .getOpportunities(needTypeId: needTypeId, intrest: interestId), completion: completion)
    }
    func oppourtinityDetails(opportunity_id: Int, completion: @escaping (Result<BaseResponse<OppourtinityDetails>, Error>) -> ()) {
        request(target: .oppourtinityDetails(opportunity_id: opportunity_id), completion: completion)
    }
    
    func Filter(investmentFrom: String, investmentTo: String, work_type: String, level_of_difficulty: String, amount_of_technology: String, completion: @escaping (Result<BaseResponse<Oppourtinity>, Error>) -> ()) {
        request(target: .Filter(investmentFrom: investmentFrom, investmentTo: investmentTo, work_type: work_type, level_of_difficulty: level_of_difficulty, amount_of_technology: amount_of_technology), completion: completion)
    }
    
  
    
}
