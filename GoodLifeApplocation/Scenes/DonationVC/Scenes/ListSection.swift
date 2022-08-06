//
//  ListSection.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 31/07/2022.
//

import Foundation
enum ListSection {
    case FeaturedFund([ListItem])
    case otherFund([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .FeaturedFund(let items),
                .otherFund(let items):
               
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .FeaturedFund:
            return "Featured Fund"
        case .otherFund:
            return "Other Fund"
  
        }
    }
}


