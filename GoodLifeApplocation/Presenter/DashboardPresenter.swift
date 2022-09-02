//
//  DashboardPresenter.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 01/09/2022.
//

import Foundation
import Moya

protocol DashboardDelegate{
    func showAlert(title:String,message:String)
    func getCategories(data:[Categories])
    func getResource(data:[Resources])
    func getMyTask(data:DashboardTask)


}

typealias dashboardDelegate = DashboardDelegate & UIViewController


class DashboardPresenter:NSObject{
    


    var delegate :dashboardDelegate?
    
     func getCategories(){
        DashboardManager.shared.getCategories { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getCategories(data: response.data?.categories ?? [])
                }else{
                    self.delegate?.showAlert(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")
            }
        }
        
    }
    
     func getResource(){
        DashboardManager.shared.getResource { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getResource(data: response.data?.resources ?? [])
                }else{
                    self.delegate?.showAlert(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")
            }
        }
        
    }
    
     func AddTask(title:String,category_id:Int,all_days:String,start_date:String,end_date:String){
        DashboardManager.shared.AddTask(title: title, category_id: category_id, all_days: all_days, start_date: start_date, end_date: end_date) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlert(title:"Success", message: response.message)

                }else{
                    self.delegate?.showAlert(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")
            }
        }
        
    }
    
     func AddGoal(title:String,category_id:Int,deadline:String){
        DashboardManager.shared.AddGoal(title: title, category_id: category_id, deadline: deadline) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.showAlert(title:"Success", message: response.message)

                }else{
                    self.delegate?.showAlert(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")
            }
        }
        
    }
    
    func getMyTask(){
        DashboardManager.shared.getMyTask { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.delegate?.getMyTask(data: response.data!)
                    
                }else{
                    self.delegate?.showAlert(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
    func markMyTask(taskid:Int){
        DashboardManager.shared.markMyTask(taskID: taskid) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                    self.getMyTask()
                    self.delegate?.showAlert(title:"Success", message: "completed successfully")
                   

                }else{
                    self.delegate?.showAlert(title:"Failure", message: response.message)
                }
                
            case let .failure(error):
                self.delegate?.showAlert(title:"Failure", message: "something wrong try again")
            }
        }
    }
    
}
