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
    func getOpportunities(categories:Opportuntiesss)

    func getCategoriesFiltered(categories:Home)
    func getOppourtinityDetails(categories:OppourtinityDetails)
    func getMainScreenData(data:MainScreenData)
    
    
}

typealias homeDelegate = HomeDelegate & UIViewController


class HomePresenter:NSObject{
    
    var delegate :homeDelegate?
    
//    func getCategoriesData(searchTxt:String){
//        
//        HomeManager.shared.Home(txt: searchTxt) {  Response in
//            switch Response{
//                
//            case let .success(response):
//                if response.status == true{
//                    self.delegate?.getCategories(categories: response.data!)
//                    
//                    
//                }else{
//                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
//                }
//            case  .failure(_):
//                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
//            }
//        }
//        
//    }

    
    func categriesFailtered(mainCategoriesID:String,subCategoriesID:String,latitude:String,longitude:String,city:String){
        HomeManager.shared.categoriesFiltering(mainCategoriesID: mainCategoriesID, subCategoriesID: subCategoriesID,latitude:latitude,longitude:longitude,city:city) { Response in
            
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getCategoriesFiltered(categories: response.data! )
                    
                }else{
                    Alert.showErrorAlert(message: "something wrong try again")
                }
            case  .failure(_):
                Alert.showErrorAlert(message: "something wrong try again")
            }
        }
    }

    
    func oppourtinityDetails(opportunityID:Int){
        
        HomeManager.shared.oppourtinityDetails(opportunity_id: opportunityID) { Response in
            switch Response{
                
            case let .success(response):
                if response.code == 200{
                    self.delegate?.getOppourtinityDetails(categories: response.data!)
                    
                }else if response.code == 401{
                    SceneDelegate.init().setRootVC(vc: SplashScreen())
                }else{
                    Alert.showErrorAlert(message: "something wrong try again")
                }
                
            case  .failure(_):
                
                Alert.showErrorAlert(message: "something wrong try again")
            }
        }
        
    }
    
    
    func AllOpportunities(){
        HomeManager.shared.Home { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getOpportunities(categories: response.data! )
                    
                }else{
                    Alert.showErrorAlert(message: response.message!)
                }
            case  .failure(_):
                Alert.showErrorAlert(message: "something wrong try again")
            }
        }
    }
//    
//    func filterPackages(investmentFrom:String,investmentTo:String,work_type:String,level_of_difficulty:String,amount_of_technology:String){
//        HomeManager.shared.Filter(investmentFrom: investmentFrom, investmentTo: investmentTo, work_type: work_type, level_of_difficulty: level_of_difficulty, amount_of_technology: amount_of_technology) { Response in
//            
//            switch Response{
//                
//            case let .success(response):
//                if response.status == true{
//                    self.delegate?.getOppourtinity(categories: response.data!)
//                    
//                }else{
//                    self.delegate?.showAlerts(title:"Failure", message: response.message ?? "")
//                }
//            case  .failure(_):
//                
//                self.delegate?.showAlerts(title:"Failure", message: "something wrong try again")
//            }
//            
//        }
//    }
    

    

   
}
