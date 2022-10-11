//
//  HomePresenter.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/10/2022.
//

import Foundation
import Moya

protocol HomeDelegate{
    
    func showAlerts(title:String,message:String)
    func getCategories(categories:Home)
    func getStandardCategoriesFiltering(categories:MainHomeCategories)
    func getsubCategoriesFiltering(categories:SubHomeCategories)
    func getCategoriesFiltered(categories:CategoriesFiltering)
    func getOppourtinity(categories:Oppourtinity)
    func getOppourtinityDetails(categories:OppourtinityDetails)

}

typealias homeDelegate = HomeDelegate & UIViewController


class HomePresenter:NSObject{
    
    var delegate :homeDelegate?
    
    func getCategoriesData(searchTxt:String){
        
        HomeManager.shared.Home(txt: searchTxt) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getCategories(categories: response.data! )
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
        
    }
    
    func mainStandardFilter(){
        HomeManager.shared.MainCategory { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getStandardCategoriesFiltering(categories: response.data! )
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    
    func subStandardFilter(){
        HomeManager.shared.subCategory { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getsubCategoriesFiltering(categories: response.data! )
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    func categriesFailtered(mainCategoriesID:String,subCategoriesID:String){
        HomeManager.shared.categoriesFiltering(mainCategoriesID: mainCategoriesID, subCategoriesID: subCategoriesID) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getCategoriesFiltered(categories: response.data! )
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
        }
    func getSmartRecommendation(interestId:Int,needTypeId:Int){
        HomeManager.shared.getOpportunities(needTypeId: needTypeId, interestId: interestId) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getOppourtinity(categories: response.data!)
                }else{
                    self.delegate?.showAlerts(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    func oppourtinityDetails(opportunityID:Int){
        
        HomeManager.shared.oppourtinityDetails(opportunity_id: opportunityID) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    
                    self.delegate?.getOppourtinityDetails(categories: response.data!)
                    
                }else{
                    
                    self.delegate?.showAlerts(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                
                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
            }
        }
        
    }
    
    
    
    
   
}
