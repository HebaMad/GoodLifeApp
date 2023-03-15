//
//  MainCategories.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 14/03/2023.
//

import Foundation
struct MainCategoriesModel{
    
    //MARK: - Properties

    var AllCategories:[MainCategory]{
        [categories,map,banner,opportunities]

    }
    static let shared = MainCategoriesModel()
    
    private let categories: MainCategory = {
        
        .Categories([.init(title: "test")])
        
    }()
    private let banner: MainCategory = {
        
        .Banner([.init(title: "test")])
        
    }()
                
    private let map : MainCategory = {
            
            .Map([.init(title: "test")])
        }()
                    
    private let opportunities: MainCategory = {
            
            .Opportunities([.init(title: "test")])
        }()
              

    
}



