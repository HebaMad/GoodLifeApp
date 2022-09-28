//
//  LessonTopicDetails.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 28/09/2022.
//

import Foundation

struct LessontopicDetails{
    
    //MARK: - Properties
    
    var AllCategories:[lessonDetails]{
        
           [overview,keyAspect,keyTakeaway]
    }
    
    static let shared = LessontopicDetails()
    private let overview:lessonDetails = {
        
        .overView([.init(title: "Community Life"),.init(title: "Our Lives"),.init(title: "Ecosystem")])
    }()
    private let keyAspect:lessonDetails = {
        
        .keyAspect([.init(title: "Community Life"),.init(title: "Our Lives"),.init(title: "Ecosystem")])
    }()
    
    private let keyTakeaway:lessonDetails = {
        .keyTakeaway([.init(title: "Community Life"),.init(title: "Our Lives"),.init(title: "Ecosystem")])
    }()
 
    
}
