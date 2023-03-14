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


enum lessonDetails{
    case overView([listData])
    case keyAspect([listData])
    case keyTakeaway([listData])
    
    var items: [listData] {
        switch self {
        case .overView(let items),.keyAspect(let items),.keyTakeaway(let items):
               
            return items
        }
    }
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .overView:
            return "Overview"
        case .keyAspect:
            return "key Aspect"
        case .keyTakeaway:
            return "key Takeaways"
  
        }
    }
}


enum Hobbies{
    case talent([listData])
    case interest([listData])
    
    var items: [listData] {
        
        switch self {
            
        case .talent(let items),.interest(let items):
               
            return items
        }
        
    }
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .talent:
            return "Pick up your  Talents!"
        case .interest:
            return "Pick up your favorite interests!"

  
        }
    }
    
    
}


enum StewardingResource{
    case talent([listData])
    case interest([listData])
    case Time([listData])
    
    
    var items: [listData] {
        
        switch self {
            
        case .talent(let items),.interest(let items),.Time(let items):
               
            return items
     
        }
        
    }
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .talent:
            return "Talents"
        case .interest:
            return "Interests"
        case .Time:
            return "Time"

        }
    }
    
    
}

enum MainCategory{
    case Categories([listData])
    case Banner([listData])
    case Map([listData])
    case Opportunities([listData])

    var title: String {
        switch self {
        case .Categories:
            return "Categories"
        case .Banner:
            return "Banner"
        case .Map:
            return "Map"
        case .Opportunities:
            return "Opportunities"

        }
    }
    
}
