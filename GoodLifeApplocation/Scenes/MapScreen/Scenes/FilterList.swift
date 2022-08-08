//
//  FilterList.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 08/08/2022.
//

import Foundation

enum FilterList{
    case recentlyViewed([listData])
    case recommendedMinistries([listData])
    
    var items: [listData] {
        switch self {
        case .recentlyViewed(let items),.recommendedMinistries(let items):
               
            return items
        }
    }
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .recentlyViewed:
            return "Recently Viewed"
        case .recommendedMinistries:
            return "Recommended Ministries"

        }
    }
}
