//
//  DataModel.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/08/2022.
//

import Foundation

// MARK: - Empty Model
struct Empty:Decodable{

}

struct Home:Decodable{
    
    let main_needs_types:[mainType]?
    let recentlyViewed:[mainType]?
    let recommendedMinistries:[mainType]?
    
}


struct CategoriesFiltering:Decodable{
    
    let main_needs_types:[mainType]?
    
}

struct mainType:Codable{
    let id:Int?
    let latitude:String?
    let longitude:String?
    let city:String?
    let main_category_id:Int?
    let sub_category_id:Int?
    let logo:String?
    let name:String?
    
}
struct MainHomeCategories:Decodable{
    let categories:[MainCategories]?
}
struct SubHomeCategories:Decodable{
    let categories:[MainCategories]?

}


struct Oppourtinity:Decodable{
    let items :[OppourtinityDetails]?
    
}

struct OppourtinityDetails : Codable {
    
    let id:Int?
    let category:String?
    let type:String?
    let work_type:String?
    let level_of_difficulty:String?
    let amount_of_technology:String?
    let amount_raise:String?
    let need_type_id:String?
    let interest:String?
    let title:String?
    let sub_title:String?
    let websites:String?
    let models:String?
    let plans:String?
    let image:String?
    let created_at:String?
    let opportunity_match:String?
    let rate:Int?
    let rate_count:Int?
    let reviews_count:Int?
    let general:[GeneralOppourtinity]?
    let specific:[SpecificOppourtinity]?

}



struct Graph:Codable{
    let name:String?
    let percent:String?
}

struct GeneralOppourtinity:Codable{
    let type:String?
    let title:String?
    let footer_title:String?
    let details:String?
    let items:[GeneralOppourtinityDetails]?
    let graph:[Graph]?

}

struct GeneralOppourtinityDetails:Codable{
    
    let title:String?
    let url:String?
    let approach:String?
    let details:String?
    let cost:String?
    let childs:[OppurtinityDetails]?
    
}

struct OppurtinityDetails: Codable {
    
    let title:String?
    let url:String?
    let details:String?
    let cost:String?
    
}

struct SpecificOppourtinity : Codable {
    
    let type:String?
    let title:String?
    let footer_title:String?
    let details:String?
    let items:[SpecificOppourtinityDetails]?
    let graph:[Graph]?

    
}
struct SpecificOppourtinityDetails:Codable{
    
    let title:String?
    let url:String?
    let details:String?
    let cost:String?
    let childs:[OppurtinityDetails]?
    
}


struct MainCategories:Codable{
    let id:Int?
    let type:String?
    let status:String?
    let icon:String?
    let created_at:String?
    let name:String?
    
}

struct userProfile: Decodable{
    
    let id:Int?
    let name:String?
    let mobile:String?
    let latitude:String?
    let longitude:String?
    let work_type:String?
    let amount_raise:String?
    let status:String?
    let access_token:String?
    let image_profile:String?
    let location:String?
    let ventures:[Ventures]?

}

struct goalCreation:Decodable{
    let user_id:Int?
    let title:String?
    let category_id:String?
    let deadline:String?
    let created_at:String?
    let id:Int?

 
}

struct termsAndConditions: Decodable{
    
    let url:String?
    let image:String?
    let title:String?
    let description:String?

}

struct startFundRaise:Decodable{
    
    let id:Int?
    let name:String?
    let mobile:String?
    let latitude:String?
    let longitude:String?
    let work_type:String?
    let amount_raise:String?
    let access_token:String?
}
struct contactUS:Decodable{
    
    let user_id:Int?
    let message:String?
    let created_at:String?
    let id:Int?
      
}

struct volunteerOppourtinity:Decodable{
    
    let user_id:Int?
    let title:String?
    let latitude:String?
    let longitude:String?
    let date:String?
    let time:String?
    let details:String?
    let created_at:String?
    let id:Int?
  
}


struct IdeaCreation:Decodable{
    
    let user_id:Int?
    let title:String?
    let details:String?
    let time_commitment:String?
    let monthly_revenue:String?
    let created_at:String?
    let id:Int?

    
}

struct FeedbackCreation:Decodable{
    let user_id:Int?
    let title:String?
    let review:String?
    let rate:String?
    let created_at:String?
    let id:Int?
}

struct Ventures:Codable{
    let id:Int?
    let category:String?
    let type:String?
    let work_type:String?
    let level_of_difficulty:String?
    let amount_of_technology:String?
    let amount_raise:String?
    let need_type_id:Int?
    let interest:String?
    let title:String?
    let sub_title:String?
    let websites:String?
    let models:String?
    let plans:String?
    let image:String?
    let created_at:String?
    let opportunity_match:String?
    let rate:Int?
    let rate_count:Int?
    let reviews_count:Int?


}


struct Categories:Codable{
    
    let id:Int?
    let opportunity_id:String?
    let sub_title:String?
    let title:String?
    let details:String?
    let complete_percent:Int?
    
}

struct DahboardCategory:Decodable{
    let notificationsCount:Int?
    let categories:[Categories]?
}

struct DashboardResource:Decodable{
    let resources:[Resources]?
    
}

struct Resources:Decodable{
    let id:Int?
    let title:String?
    let details:String?
    let icon:String?
    let category:Categories?
}

struct DashboardTask:Decodable{
    
    let currentTasks :[Tasks]?
    let completedTasks :[Tasks]?

}
struct Tasks:Codable{
    
    let id:Int?
    let title:String?
    let user_id:String?
    let category_id:String?
    let all_days:String?
    let start_date:String?
    let end_date:String?
    let completed:String?
    let created_at:String?
    let category:Categories?

}


struct GoalsAndBenchmark:Decodable{
    let category:Categories?
    let activeGoals:[Goals]?
    let pastGoals:[Goals]?
    let benchmarks:[Benchmark]?

}

struct Goals:Codable{
    let id:Int?
    let title:String?
    let user_id:String?
    let category_id:String?
    let deadline:String?
    let completed:String?
    let created_at:String?
    let url:String?
    let category:Categories?
}

struct Benchmark:Codable{
    let title:String?
    let you_target:String?
    let niche_target:String?
}



struct ResourceDetails:Decodable{
    
    let resource:resourceDetailss?
    let ques_ansers :[questionAndAnswers]?
    
}

struct resourceDetailss:Codable{
    
    let id:Int?
    let icon:String?
    let title:String?
    let details:String?
    let open_ads_manager_title:String?
    let open_ads_manager_url:String?
    let ad_lessons_title:String?
    let lessons:[Lessons]?
    let category:Categories?
    
    
}

struct Lessons:Codable{
    let id:Int?
    let resource_id:String?
    let title:String?
    let overview:[lessonTopic]?
    let key_aspects:[lessonTopic]?
    let key_takeaways:[lessonTopic]?
    let file:String?
    let status:String?
    let created_at:String?

    
}

struct lessonTopic:Codable{
    let title:String?
}
struct questionAndAnswers:Codable{
    
    let id:Int?
    let icon:String?
    let title:String?
    let ads_manager:String?
    let details:String?
    let category:String?

}


struct  WorthyCauses:Decodable{
    let donation_details:DonationDetails?
    let featuredFunds:[Founder]?
    let otherFunds:[Founder]?

}
struct DonationDetails:Codable{
    let title:String?
    let sub_title:String?
    let details:String?
}
struct Founder:Codable{
    let id:Int?
    let title:String?
    let details:String?
    let icon:String?
}

struct SubWorthyCauses:Decodable{
    let worthy_causes:[Founder]
}

struct AllNotifiaction: Decodable {
    let notifications:[notificationsDetails]
}

struct notificationsDetails:Codable{
    
    let id:Int?
    let title:String?
    let message:String?
    let created_at:String?
    let noti_since:String?

        
}
