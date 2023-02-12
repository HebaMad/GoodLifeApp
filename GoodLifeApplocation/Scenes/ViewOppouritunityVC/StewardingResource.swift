//
//  StewardingResource.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 12/02/2023.
//

import Foundation
struct StewardingResourceItem{
    
    var AllHobbiesItem:[StewardingResource]{
        [talent,time,interest]
    }
    
    static let shared = StewardingResourceItem()
    
     let talent:StewardingResource = {
        
        .talent([.init(title: "Sales"),
                 .init(title: "Investments"),
                 .init(title: "Sport"),
                 .init(title: "Region"),
                 .init(title: "Marketing"),
                 .init(title: "Real Estate"),
                 .init(title: "Operation"),

                ])
        
    }()
    
     let interest:StewardingResource = {
        
        .interest([.init(title: "Charity"),
                 .init(title: "Community"),
                 .init(title: "Sport"),
                 .init(title: "Region"),
                 .init(title: "Finance"),

                ])
        
    }()
    
    let time:StewardingResource = {
        
        .Time([.init(title: "Per week"),
                   .init(title: "Per month")
               

                ])
        
    }()
   
}
