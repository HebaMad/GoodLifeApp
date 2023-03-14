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
        [categories,Banner,Map,]

    }
    static let shared = HomeCategories()
    private let categories:categoriesList = {
        
        .categories([.init(title: "Goals & Benchmarks"),.init(title: "Startup Guided Lessons"),.init(title: "Startup Guided Lessons")])
        
    }()
    
    private let task:categoriesList = {
        .Task([.init(title: "Video Guided Lesson"),.init(title: "Record Attendance"),.init(title: "Track Sales")])
    }()
    private let resource:categoriesList = {
        .Resource([.init(title: "Facebook Ads Manager"),.init(title: "Google AdWords"),.init(title: "Track Sales")])
    }()
    
}



