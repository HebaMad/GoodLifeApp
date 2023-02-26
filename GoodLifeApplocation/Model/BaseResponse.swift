//
//  BaseResponse.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/08/2022.
//

import Foundation
struct BaseResponse<T:Decodable>: Decodable{
    
    let status: Bool?
    let code: Int?
    let message: String?
//    let errors: [ErrorElement]?
    let data: T?

    enum CodingKeys: String, CodingKey {
        case status
        case code
        case message
//        case errors
        case  data
    }
}

//// MARK: - Error
//struct ErrorElement: Codable {
//    let message: String
//}
