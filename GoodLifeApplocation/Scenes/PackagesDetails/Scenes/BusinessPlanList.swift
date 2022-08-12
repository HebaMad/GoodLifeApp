//
//  BusinessPlanList.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 12/08/2022.
//

import Foundation
import UIKit


struct BusinessPlanList{
    
    //MARK: - Properties
    
    var AllCategories:[SpecificList]{
        [DriveInMovie,recommendedMinistries ]

    }
    static let shared = BusinessPlanList()
    private let DriveInMovie:SpecificList = {
        
        .DriveInMovie([.init(title: "Pros", information: "Suplemental revenue from food \n Higher ticket cost"),.init(title: "Cons", information: "Variable pay \n Less consistent than other models")])
        
    }()
    
    private let recommendedMinistries:SpecificList = {
        .MovieAndDinner([.init(title: "Pros", information: "Reoccurring Revenue \n Higher Turnout"),.init(title: "Cons", information: "Less food sales \n Fewer total customers willing to subscribe")])
        }()
 
    
}
