//
//  MockData.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 31/07/2022.
//

import Foundation

struct MockData {
    static let shared = MockData()
    
    private let FeaturedFund: ListSection = {
        .FeaturedFund([.init(title: "Meal Maker", image: "icon1"),
                  .init(title: "Faith Focus", image: "icon2")
           ] )
    }()
    
    private let otherFund: ListSection = {
        .otherFund([.init(title: "CommunityCare", image: "icon1"),
                  .init(title: "Widow Welfare", image: "icon1"),
                  .init(title: "Orphan  Outlet", image: "icon1"),
                  .init(title: "Neighborhood Hero", image: "icon1"),
                  .init(title: "Ecosystem Efforts", image: "icon1"),
                    .init(title: "Poverty Pill", image: "icon1")
        ])
    }()
    

    
    var pageData: [ListSection] {
        [FeaturedFund, otherFund]
    }
}
