//
//  MainPresenter.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/03/2023.
//

import UIKit

protocol MainDelegate{
    
    func showAlerts(title:String,message:String)
    func getMainScreenData(data:MainScreenData)
    func getOpportunitiesData(data:ListOpportunities)
    func getStandardCategoriesFiltering(categories:MainHomeCategories)
    func getsubCategoriesFiltering(categories:SubHomeCategories)
    func getExploreMapData(data:ExploreMap)
    
}


typealias mainDelegate = MainDelegate & UIViewController

class MainPresenter:NSObject{
    
    var delegate :mainDelegate?
    
    func getMainScreenData(){
        
        HomeManager.shared.homescreen { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getMainScreenData(data: response.data!)
                }else{
                    Alert.showErrorAlert(message: response.message ?? "")
                }
                
            case .failure(_):
                
                Alert.showErrorAlert(message: "something wrong try again")
            }
        }
    }
    
    func deleteOpportunities(opportunity_id:String){
        MainManager.shared.deleteOpportunities(opportunity_id: opportunity_id) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlerts(title: "Success", message: response.message!)
                }else{
                    Alert.showErrorAlert(message: response.message ?? "")
                }
                
            case .failure(_):
                
                Alert.showErrorAlert(message: "something wrong try again")
            }
        }
    }
    
    func listOpportunties(search:String){
        MainManager.shared.listOpportunities(search: search) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getOpportunitiesData(data: response.data!)
                }else{
                    Alert.showErrorAlert(message: response.message ?? "")
                }
                
            case .failure(_):
                
                Alert.showErrorAlert(message: "something wrong try again")
            }
        }
    }
    
    func mainStandardFilter(){
        MainManager.shared.MainCategory { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getStandardCategoriesFiltering(categories: response.data! )
                    
                }else{
                    Alert.showErrorAlert(message: response.message ?? "")
                }
                
            case  .failure(_):
                Alert.showErrorAlert(message: "something wrong try again")
            }
        }
    }
    
    
    func subStandardFilter(){
        MainManager.shared.subCategory { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getsubCategoriesFiltering(categories: response.data! )
                    
                }else{
                    Alert.showErrorAlert(message: response.message ?? "")
                }
            case  .failure(_):
                Alert.showErrorAlert(message: "something wrong try again")
            }
        }
    }
    
    func createFundType(name: String, main_category_id: String, sub_category_id: String, latitude: String, longitude: String, city: String, default_need: String){
        HomeManager.shared.AddFundType(name: name, main_category_id: main_category_id, sub_category_id: sub_category_id, latitude: latitude, longitude: longitude, city: city, default_need: default_need) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlerts(title:"Success", message: response.message ?? "")
                    
                }else{
                    Alert.showErrorAlert(message: response.message ?? "")
                }
                
            case .failure(_):
                
                Alert.showErrorAlert(message: "something wrong try again")
            }
        }
    }
    
    func createOpportunities(title: String, city: String, state: String, description: String, name:String,tags: [String], rating: String, email: String, phone: String,representative:String){
        MainManager.shared.createOpportunties(title: title, city: city, state: state, description: description, name: name, tags: tags, rating: rating, email: email, phone: phone,representative:representative) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlerts(title:"Success", message: response.message ?? "")
                    
                }else{
                    Alert.showErrorAlert(message: response.message ?? "")
                }
                
            case .failure(_):
                
                Alert.showErrorAlert(message: "something wrong try again")
            }
        }
    }
    
    func mapScreenData(fundTypeId:String,mainCategoryId:String,subCategoryId:String,interest:String){
        MainManager.shared.mapScreenData(fundTypeId: fundTypeId, mainCategoryId: mainCategoryId, subCategoryId: subCategoryId, interest: interest){ Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getExploreMapData(data: response.data!)
                    
                }else{
                    Alert.showErrorAlert(message: response.message ?? "")
                }
                
            case .failure(_):
                
                Alert.showErrorAlert(message: "something wrong try again")
            }
        }
    }
    
}
