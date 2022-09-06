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
    
    let monthlyRevenue:[BenchmarkTopic]?
    let nightlyAttendance:[BenchmarkTopic]?

}

struct BenchmarkTopic:Codable{
    let title:String?
    let value:Int?
 
}

struct resourceDetails:Decodable{
    let ques_ansers :[questionAndAnswers]?
    
}
struct questionAndAnswers:Codable{
    
    let id:Int?
    let icon:String?
    let title:String?
    let ads_manager:String?
    let details:String?
    let category:String?

}
