//
//  HomeNetworkable.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 02/10/2022.
//

import Foundation
import Moya
protocol HomeNetworkable:Networkable  {

    func Home(completion: @escaping (Result<BaseResponse<Opportuntiesss>, Error>)-> ())
   
    func categoriesFiltering(mainCategoriesID:String,subCategoriesID:String,latitude:String,longitude:String,city:String,completion: @escaping (Result<BaseResponse<Home>, Error>)-> ())
    func getOpportunities(needTypeId:Int,interestId:Int,completion: @escaping (Result<BaseResponse<Oppourtinity>, Error>)-> ())
    func oppourtinityDetails(opportunity_id:Int,completion: @escaping (Result<BaseResponse<OppourtinityDetails>, Error>)-> ())
    func Filter(investmentFrom:String,investmentTo:String,work_type:String,level_of_difficulty:String,amount_of_technology:String,completion: @escaping (Result<BaseResponse<Oppourtinity>, Error>)-> ())
    
    func  AddFundType(name:String,main_category_id:String,sub_category_id:String,latitude:String,longitude:String,city:String,default_need:String,completion: @escaping (Result<BaseResponse<MainCategories>, Error>)-> ())
    func opportunityfiltering(invest_from:String,invest_to:String,time_commitment:String,level_of_difficulty:String,amount_of_technology:String,completion: @escaping (Result<BaseResponse<Opportuntiesss>, Error>)-> ())
    
    func homescreen(search:String,completion: @escaping (Result<BaseResponse<MainScreenData>, Error>)-> ())
    
}

class HomeManager:HomeNetworkable{

 
    typealias targetType = HomeApiTarget

    var provider: MoyaProvider<HomeApiTarget> = MoyaProvider<HomeApiTarget>(plugins: [NetworkLoggerPlugin()])
    
    public static var shared: HomeManager = {
        let generalActions = HomeManager()
        return generalActions
    }()
    
    func Home(completion: @escaping (Result<BaseResponse<Opportuntiesss>, Error>) -> ()) {
        request(target: .Home, completion: completion)
    }

    func categoriesFiltering(mainCategoriesID: String, subCategoriesID: String,latitude:String,longitude:String,city:String, completion: @escaping (Result<BaseResponse<Home>, Error>) -> ()) {
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
    func AddFundType(name: String, main_category_id: String, sub_category_id: String, latitude: String, longitude: String, city: String, default_need: String, completion: @escaping (Result<BaseResponse<MainCategories>, Error>) -> ()) {
        request(target: .AddFundType(name: name, main_category_id: main_category_id, sub_category_id: sub_category_id, latitude: latitude, longitude: longitude, city: city, default_need: default_need), completion: completion)
    }
    
    func homescreen(search:String,completion: @escaping (Result<BaseResponse<MainScreenData>, Error>) -> ()) {
        request(target: .homescreen(search: search), completion: completion)
    }
    func opportunityfiltering(invest_from:String,invest_to:String, time_commitment: String, level_of_difficulty: String, amount_of_technology: String, completion: @escaping (Result<BaseResponse<Opportuntiesss>, Error>) -> ()) {
        request(target: .opportunityfiltering(invest_from:invest_from,invest_to:invest_to, time_commitment: time_commitment, level_of_difficulty: level_of_difficulty, amount_of_technology: amount_of_technology), completion: completion)
    }
    

    

    
}
