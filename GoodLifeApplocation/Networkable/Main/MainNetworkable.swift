//
//  MainNetworkable.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/03/2023.
//


import Foundation
import Moya
protocol MainNetworkable:Networkable  {
    
    func MainCategory(completion: @escaping (Result<BaseResponse<MainHomeCategories>, Error>)-> ())
    func subCategory(completion: @escaping (Result<BaseResponse<SubHomeCategories>, Error>)-> ())
    func homescreen(completion: @escaping (Result<BaseResponse<MainScreenData>, Error>)-> ())
    func deleteOpportunities(opportunity_id:String,completion: @escaping (Result<BaseResponse<Empty>, Error>)-> ())
    func listOpportunities(search:String,completion: @escaping (Result<BaseResponse<ListOpportunities>, Error>)-> ())
    func createOpportunties(title:String,city:String,state:String,description:String,name:String,tags:[String],rating:String,email:String,phone:String,completion: @escaping (Result<BaseResponse<opportunitiesData>, Error>)-> ())
    func mapScreenData(fundTypeId:[String],mainCategoryId:String,subCategoryId:String,interest:String,completion:@escaping (Result<BaseResponse<opportunitiesData>, Error>)-> ())
    
}

class MainManager:MainNetworkable {
 

    typealias targetType = MainApiTarget

    var provider: MoyaProvider<MainApiTarget> = MoyaProvider<MainApiTarget>(plugins: [NetworkLoggerPlugin()])
    
    public static var shared: MainManager = {
        let generalActions = MainManager()
        return generalActions
        
    }()
    
    func homescreen(completion: @escaping (Result<BaseResponse<MainScreenData>, Error>) -> ()) {
        request(target: .homescreen, completion: completion)
    }
    func deleteOpportunities(opportunity_id: String, completion: @escaping (Result<BaseResponse<Empty>, Error>) -> ()) {
        request(target: .deleteOpportunities(opportunity_id: opportunity_id), completion: completion)
    }
 
    func listOpportunities(search: String, completion: @escaping (Result<BaseResponse<ListOpportunities>, Error>) -> ()) {
        request(target: .listOpportunities(search: search), completion: completion)
    }
    func MainCategory(completion: @escaping (Result<BaseResponse<MainHomeCategories>, Error>) -> ()) {
        request(target: .getNeedMainCategory, completion: completion)
    }
    func subCategory(completion: @escaping (Result<BaseResponse<SubHomeCategories>, Error>) -> ()) {
        request(target: .getNeedSubCategory, completion: completion)
    }
    func createOpportunties(title: String, city: String, state: String, description: String, name: String, tags: [String], rating: String, email: String, phone: String, completion: @escaping (Result<BaseResponse<opportunitiesData>, Error>) -> ()) {
        request(target: .createOpportunties(title: title, city: city, state: state, description: description, name: name, tags: tags, rating: rating, email: email, phone: phone), completion: completion)
    }
 
    func mapScreenData(fundTypeId: [String], mainCategoryId: String, subCategoryId: String, interest: String, completion: @escaping (Result<BaseResponse<opportunitiesData>, Error>) -> ()) {
        request(target: .mapScreenData(fundTypeId: fundTypeId, mainCategoryId: mainCategoryId, subCategoryId: subCategoryId, interest: interest), completion: completion)
    }
    
 
    

}
