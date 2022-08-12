//
//  SpecificList.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 12/08/2022.
//

import Foundation
enum SpecificList{
    case MovieAndDinner([BusinessPlanData])
    case DriveInMovie([BusinessPlanData])
    
    var items: [BusinessPlanData] {
        switch self {
        case .MovieAndDinner(let items),.DriveInMovie(let items):
               
            return items
        }
    }
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .MovieAndDinner:
            return "Movie and Dinner"
        case .DriveInMovie:
            return "Drive in Movie"

        }
    }
}
