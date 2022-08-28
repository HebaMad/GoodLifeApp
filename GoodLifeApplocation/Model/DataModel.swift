//
//  DataModel.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/08/2022.
//

import Foundation

// MARK: - Empty Model
struct Empty:Decodable{

}

struct userProfile: Decodable{
    
    let id:Int?
    let name:String?
    let mobile:String?
    let latitude:String?
    let longitude:String?
    let work_type:String?
    let amount_raise:Float?
    let access_token:String?

}

struct termsAndConditions: Decodable{
    
    let url:String?
    let image:String?
    let title:String?
    let description:String?

}

struct startFundRaise:Decodable{
    
    let id:Int?
    let name:String?
    let mobile:String?
    let latitude:String?
    let longitude:String?
    let work_type:String?
    let amount_raise:Float?
}
struct contactUS:Decodable{
    
    let user_id:Int?
    let message:String?
    let created_at:String?
    let id:Int?
      
}

struct volunteerOppourtinity:Decodable{
    
    let user_id:Int?
    let title:String?
    let latitude:String?
    let longitude:String?
    let date:String?
    let time:String?
    let details:String?
    let created_at:String?
    let id:Int?
  
}


struct IdeaCreation:Decodable{
    
    let user_id:Int?
    let title:String?
    let details:String?
    let time_commitment:String?
    let monthly_revenue:String?
    let created_at:String?
    let id:Int?

    
}

struct FeedbackCreation:Decodable{
    let user_id:Int?
    let title:String?
    let review:String?
    let rate:String?
    let created_at:String?
    let id:Int?
}

