//
//  MapFilterList.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 08/08/2022.
//

import Foundation
import UIKit

struct MapFilterList{
    
    //MARK: - Properties
    
    var AllCategories:[FilterList]{
        [recentlyViewed,recommendedMinistries ]

    }
    static let shared = MapFilterList()
    private let recentlyViewed:FilterList = {
        
        .recentlyViewed([.init(title: "Community Movie Night"),.init(title: "Community Dinner"),.init(title: "Shared Workspace")])
        
    }()
    
    private let recommendedMinistries:FilterList = {
        .recommendedMinistries([.init(title: "Community Life"),.init(title: "Our Lives"),.init(title: "Ecosystem")])
    }()
 
    
}

