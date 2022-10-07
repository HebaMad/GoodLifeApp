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
    let amount_raise:Float?
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
    let amount_raise:Float?
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
    
    
    let id :Int?
    let category:String?
    let work_type:String?
    let amount_raise :Int?
    let need_type_id :Int?
    let interest:String?
    let title:String?
    let image:String?
    let rate :Int?
    let created_at :String?
    let models:[String]?
    let plans:[String]?
    let websites:[String]?
    let reviews_count :Int?


}


struct Categories:Codable{
    
    let id:Int?
    let title:String?
    let details:String?
    let complete_percent:Int?
    
}
struct DahboardCategory:Decodable{
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
    let user_id:Int?
    let category_id:Int?
    let all_days:String?
    let start_date:String?
    let end_date:String?
    let completed:String?
    let created_at:String?
    let category:Categories?

}


struct GoalsAndBenchmark:Decodable{

    let activeGoals:[Goals]?
    let pastGoals:[Goals]?
    let benchmarks:[Benchmark]?

}

struct Goals:Codable{
    let id:Int?
    let title:String?
    let user_id:Int?
    let category_id:Int?
    let deadline:String?
    let completed:String?
    let created_at:String?
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
    let resource_id:Int?
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
    let featuredFunds:[Founder]?
    let otherFunds:[Founder]?

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

