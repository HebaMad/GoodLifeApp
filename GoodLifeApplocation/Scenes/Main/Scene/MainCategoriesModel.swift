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
        [categories,banner,map,opportunities]

    }
    static let shared = MainCategoriesModel()
    
    private let categories: MainCategory = {
        
        .Categories(.init())
        
    }()
    private let banner: MainCategory = {
        
        .Banner(.init())
        
    }()
                
    private let map : MainCategory = {
            
            .Map(.init())
        }()
                    
    private let opportunities: MainCategory = {
            
            .Opportunities(.init())
        }()
              

    
}



