//
//  HobbiesItems.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 10/02/2023.
//

import Foundation
struct HobbiesItem{
    
    var AllHobbiesItem:[Hobbies]{
        [talent,interest]
    }
    
    static let shared = HobbiesItem()
    
     let talent:Hobbies = {
        
        .talent([.init(title: "Sales"),
                 .init(title: "Investments"),
                 .init(title: "Sport"),
                 .init(title: "Region"),
                 .init(title: "Marketing"),
                 .init(title: "Real Estate"),
                 .init(title: "Operation"),

                ])
        
    }()
    
     let interest:Hobbies = {
        
        .interest([.init(title: "Charity"),
                 .init(title: "Community"),
                 .init(title: "Sport"),
                 .init(title: "Region"),
                 .init(title: "Finance"),

                ])
        
    }()
   
}
