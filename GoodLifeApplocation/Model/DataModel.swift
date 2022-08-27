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
