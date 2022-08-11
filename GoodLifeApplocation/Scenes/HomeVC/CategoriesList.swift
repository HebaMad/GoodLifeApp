//
//  CategoriesList.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 05/08/2022.
//

import Foundation

enum categoriesList{
    case categories([listData])
    case Task([listData])
    case Resource([listData])
    
    var items: [listData] {
        switch self {
        case .categories(let items),.Resource(let items),.Task(let items):
               
            return items
        }
    }
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .categories:
            return "Categories"
        case .Task:
            return "My Task"
        case .Resource:
            return "Resources"
  
        }
    }
}