//
//  MenuApiController.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/08/2022.
//

import Foundation
import UIKit

struct MenuApiController{
  
    public static var shard: MenuApiController = {
        let MenuApiController = MenuApiController()
        return MenuApiController
    }()
    
    
    private func VolunteerOppourtinity(title:String,latitude:String,longitude:String,date:String,time:String,details:String,callback:@escaping Callback){
      
        MenuManager.shared.volunteerOppourtinity(title: title, latitude: latitude, longitude: longitude, date: date, time: time, details: details) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                        callback(true, response.message)
                
                }else{
                    callback(false, response.message)
                }
                
            case let .failure(error):
                callback(false, error.localizedDescription)
            }
            
        }
        
    }
    
    private func createIdea(title:String,details:String,time_commitment:String,monthly_revenue:String,callback:@escaping Callback){
        MenuManager.shared.createIdea(title: title, details: details, time_commitment: time_commitment, monthly_revenue:monthly_revenue ) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                        callback(true, response.message)
                
                }else{
                    callback(false, response.message)
                }
                
            case let .failure(error):
                callback(false, error.localizedDescription)
            }
            
        }
    }
    
    private func createFeedback(title:String,review:String,rate:String,img:Data,callback:@escaping Callback){
        MenuManager.shared.createFeedback(title: title, review: review, rate: rate, img: img) { Response in
            switch Response{
                
            case let .success(response):
                if response.status == true{
                        callback(true, response.message)
                
                }else{
                    callback(false, response.message)
                }
                
            case let .failure(error):
                callback(false, error.localizedDescription)
            }
            
        }
        
    }
}
