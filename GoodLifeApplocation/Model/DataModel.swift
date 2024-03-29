//
//  DataModel.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/08/2022.
//

import UIKit
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
    let main_category_id:String?
    let sub_category_id:String?
    let logo:String?
    let name:String?
    let default_need:String?
    
}

struct FundType : Decodable{
    let fund_types:[mainType]?
}
struct MainHomeCategories : Decodable{
    let categories:[MainCategories]?
}
struct SubHomeCategories : Decodable{
    let categories:[MainCategories]?
    
}

struct RecommendedChannel : Decodable {
    
    let top_advertising_platforms:[String]?
    let social_channels:[String]?
    
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
    let generals:[GeneralOppourtinity]?
    let specifics:[SpecificOppourtinity]?
    
}




struct GeneralOppourtinity:Codable{
    
    let type:String?
    let title:String?
    let footer_title:String?
    let details:String?
    let items:[GeneralOppourtinityDetails]?
    let graph:[Graph]?
    
}
struct Graph: Codable {
    
    let title:String?
    let percentage:String?
}

struct GeneralOppourtinityDetails: Codable {
    
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
struct SpecificOppourtinityDetails: Codable {
    
    let title:String?
    let url:String?
    let details:String?
    let cost:String?
    let childs:[OppurtinityDetails]?
    
}


struct MainCategories: Decodable {
    
    let id:Int?
    let name:String?
    let type:String?
    let icon:String?
    let created_at:String?
    
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
    let api_token:String?
    let image_profile:String?
    let location:String?
    let ventures:[Ventures]?
    let city:String?
    let timePerHour:String?
    let timePerMonth:String?
    let interests:[String]?
    let talents:[String]?
    let ministry_ideas:[MinistryIdea]?
    let volunteer_requests:[VolunteerRequests]?
    let noOfMeals:Int?
    let badges_icons:String?
    let badges:String?
    
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
    let api_token:String?
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
    let review:String?
    let opportunity_id:String?
    let ratings:[RatingInfo]?
    let user_id:Int?
    let id:Int?
    let rate:String?

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
    let name:String?
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
    let opportunity:[opportunitiesData]?
    
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


struct StewardingMyResource:Decodable{
    let money:Money?
    let timeAndTalent:TimeAndTalent?
}

struct Money:Codable{
    let revenue:String?
    let investments:String?
    let available_support:String?
}
struct TimeAndTalent:Codable {
    let talents:[String?]?
    let interests:[String?]?
    let time:[Time]?
    
}
struct Time:Codable{
    let title:String?
    let value:String?
}



struct MinistryIdea:Decodable {
    
    let id : Int?
    let user_id:String?
    let title:String?
    let details:String?
    let time_commitment:String
    let monthly_revenue:String?
    let fund_type_id:String?
    let location:String?
    let read : String?
    let created_at:String?
    let fund_type:CategoryFundType?
    
}
struct VolunteerRequests:Decodable {
    
    let id : Int?
    let user_id:String?
    let title:String?
    let details:String?
    let date:String?
    let time:String?
    let longitude:String?
    let latitude:String?
    let location:String?
    let read : String?
    let created_at:String?
    
}

struct CategoryFundType:Decodable{
    
    let id:Int?
    let name:String?
    let image:String?
    let views:String?
    let status:String?
    let created_at:String?
    let updated_at:String?
    let deleted_at:String?
    
    
}

struct MainRequest:Decodable{
    
    let categories:[categoryData]?
    let opportunities:[opportunitiesData]?
    
}

struct categoryData:Codable{
    
    let id:Int?
    let name:String?
    let logo:String?
    let main_category_id:String?
    let sub_category_id:String?
    let latitude:String?
    let longitude:String?
    let city:String?
    let default_need:String?
    
}
struct opportunitiesData:Codable{
    let id:Int?
    let user_id:String?
    let name:String?
    let city:String?
    let state:String?
    let title:String?
    let description:String?
    let representative:String?
    let tags:[String]?
    let rating:String?
    let email:String?
    let phone:String?
    let status:String?
    let completion:Int?
    let created_at:String?
    let rate:Int?
    let rate_count:Int?
    let general:GeneralInfo?
    let marketing:MarketingInfo?
    let liturgical:LiturgicalInfo?
    let digital:DigitalInfo?
    let business_plan:BusinessPlanInfo?
    let feedbacks:[FeedbackInfo]?
    let fund_types:[fund_typess]?
    let match:String?

}

struct OpportunitiiiesD:Codable{
    
    let opportunity:opportunitiesData?
    let  matchingResult:Int?

}

struct FeedbackInfo:Codable{
    let id:Int?
    let user_id:String?
    let opportunity_id:String?
    let review:String?
    let file:String?
    let rate:String?
    let ratings:[RatingInfo]?
    
}
struct RatingInfo:Codable{
    let type:String?
    let value:String?
}

struct BusinessPlanInfo:Codable{
    let id:Int?
    let opportunity_id:String?
    let business_plans:[BusinessPlanDetails]?
}

struct BusinessPlanDetails:Codable{
    let url:String?
    let name:String?
    let market_size:String?
    let details:[MarketingBreakdown]?
}

struct DigitalInfo:Codable{
    let id:Int?
    let opportunity_id:String?
    let url:String?
    let competitors:[String]?
}
struct LiturgicalInfo:Codable{
    let id:Int?
    let opportunity_id:String?
    let graphs:[Graph]?
    let common_ways:[String]?
    
}
struct MarketingInfo:Codable{
    let id:Int?
    let opportunity_id:String?
    let graphs:[Graph]?
    let marketing_breakdown:[MarketingBreakdown]?

    
}
struct MarketingBreakdown:Codable{
    let title:String?
    let value:String?
}

struct GeneralInfo:Codable{
    let id:Int?
    let opportunity_id:String?
    let amount_raise:String?
    let work_type:String?
    let level_of_difficulty:String?
    let amount_of_technology:String?
    let interest:String?
    let financial_models:String?
    let average_annual_revenue:String?
    let average_monthly_cost:String?
}

struct MainScreenData:Decodable{
    let categories:[mainType]?
    let opportunities:[opportunitiesData]?
    let sliders:[sliderData]?
    
}

struct ListOpportunities:Decodable{
    let opportunities:[opportunitiesData]?
    
}


struct sliderData:Codable{
    
    let title:String?
    let description:String?
    let image:String?
    
}

struct ExploreMap : Decodable {
    let opportunities:[opportunitiesData]?
    
}

struct FundTyps:Decodable {
    let fund_types:[fund_typess]?
}
struct fund_typess:Codable {
    let id:Int?
    let name:String?
    let image:String?
    let pivot:Pivot?
    
}

struct Pivot:Codable{
    let opportunity_id:String?
    let fund_type_id:String?
}

struct Opportuntiesss:Decodable {
    let opportunities:[opportunitiesData]?
}


struct opportunitiesDetails:Decodable {
    let header:HeaderInfo?
    let financial:financialInfo?
    let marketing:MarketingInfo?
    let liturgical:LiturgicalInfo?
    let digital:DigitalInfo?
    let businessPlan:BusinessPlanInfo?
}


struct financialInfo:Codable {
    let average_annual_revenue:String?
    let average_monthly_cost:String?
    let expected_earning:String?
}

struct HeaderInfo:Decodable {
    
    let name:String?
    let title:String?
    let rate:Int?
    let rate_count:Int?
    let match:String?
    let financial_models:String?
    
}

struct OpportunityData:Decodable{
    
    let general:GeneralInfos?
    let financial:financialInfo?
    let marketing:MarketingInfos?
    let liturgical:LiturgicalInfo?
    let digital:DigitalInfo?
    let businessPlan:[businessplanDetails]?
    
}

struct GeneralInfos:Codable{
    let category:[categoriesData]?
    let amount_raise:String?
    let work_type:String?
    let level_of_difficulty:String?
    let financial_models:[String]?
    let interest:String?
    let amount_of_technology:String?
    
}

struct categoriesData:Codable {
    let id:Int?
    let name:String?
    
}

struct MarketingInfos:Codable {
    
    let top_advertising_platforms:[String]?
    let recommended_social_channels:[String]?
    let graphs:[Graph]?
    
}

struct businessplanDetails:Codable{
    let name:String?
    let url:String?
    let market_size:String?
    let pros:String?
    let cons:String?
}

