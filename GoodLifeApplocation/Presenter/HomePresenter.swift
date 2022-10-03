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
    
    
    
    
    
    
    
    
}
