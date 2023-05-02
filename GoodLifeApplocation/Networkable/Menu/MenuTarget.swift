//
//  MenuTarget.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/08/2022.
//

import Foundation
import Moya

enum MenuApiTarget:TargetType{
    
    case VolunteerOppourtinity(title:String,location:String,date:String,time:String,details:String)
    case createIdea(title:String,details:String,time_commitment:String,monthly_revenue:String,fund_type_id:String,location:String)
    case createFeedback(opportunity_id:String,review:String,ratings:[String:String])
    case getWorthyCauses
    case getSubWorthyCauses(worthycauseId:Int)
    case makeDonation(worthycauseId:Int,amount:String)
    case FundType
    case stewardingMyResourse
    case updateStewardingTime(timePerHour:String,timePerMonth:String)
    case updateAvailableSupportMoney(availableSupport:String)
    case updateTalent(talent:[String])
    case updateInterest(intrest:[String])
    case getFundType(opportunitiesid:String)

    var baseURL: URL {
        return URL(string: "\(AppConfig.apiBaseUrl)")!
    }
    
    
    var path: String {
        switch self {
        case .VolunteerOppourtinity:return "createVolunteerRequest"
            
        case .createIdea:return "createMinistryIdea"
            
        case .createFeedback:return "createFeedback"
            
        case .getWorthyCauses:return "getWorthyCauses"
            
        case .getSubWorthyCauses: return "getSubWorthyCauses"
            
        case .makeDonation:return "makeDonation"
            
        case .FundType:return "getFundTypes"
            
        case .stewardingMyResourse:return "getStewarding"
            
        case .updateStewardingTime,.updateInterest,.updateTalent: return "updateStewarding"
            
        case .updateAvailableSupportMoney:return "updateAvailableSupport"
            
        case .getFundType:return "getFundTypes"
            
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .VolunteerOppourtinity,.createIdea,.createFeedback,.makeDonation,.updateStewardingTime,.updateAvailableSupportMoney,.updateInterest,.updateTalent:
            return .post
            
        case .getWorthyCauses,.getSubWorthyCauses,.FundType,.stewardingMyResourse,.getFundType:
            return .get
            
 
        }
    }
    
    var task: Task{
        switch self{
            
        case .VolunteerOppourtinity,.createIdea,.makeDonation,.updateStewardingTime,.updateAvailableSupportMoney,.updateInterest,.updateTalent,.createFeedback:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)
            
        case .getWorthyCauses,.FundType,.stewardingMyResourse:
            return .requestPlain
            
        case .getSubWorthyCauses,.getFundType:
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
            
        }
    }
    var headers: [String : String]?{
        switch self{
        case .VolunteerOppourtinity,.createIdea,.createFeedback,.makeDonation,.FundType,.stewardingMyResourse,.updateStewardingTime,.updateAvailableSupportMoney,.updateInterest,.updateTalent,.getFundType:
            
            do {
                let token = try KeychainWrapper.get(key: AppData.mobile) ?? ""
                return ["Authorization":token ,"Accept":"application/json","Accept-Language":"en"]
            }
            catch{
                return ["Accept":"application/json","Accept-Language":"en"]
            }
        case .getWorthyCauses,.getSubWorthyCauses:
            return ["Accept":"application/json","Accept-Language":"en"]
            
        }
    }
    
    var param: [String : Any]{
        
        switch self {
        case .VolunteerOppourtinity(let title,let location,let date,let time,let details):
            return ["title":title,"location":location,"date":date,"time":time,"details":details]
            
        case .createIdea(let title,let details,let time_commitment,let monthly_revenue,let fund_type_id,let location):
            return ["title":title,"details":details,"time_commitment":time_commitment,"monthly_revenue":monthly_revenue,"fund_type_id":fund_type_id,"location":location]
        case .getSubWorthyCauses(let worthycauseId):
            return ["worthy_cause_id":worthycauseId]
            
        case .makeDonation(let worthycauseId,let amount):
            return ["worthy_cause_id":worthycauseId,"amount":amount]
        case .updateStewardingTime(let timePerHour,let timePerMonth):
            return ["timePerHour":timePerHour,"timePerMonth":timePerMonth]
        case .updateAvailableSupportMoney(let availableSupport):
            return ["available_support":availableSupport]
        case .updateTalent(let talent):
            return ["talents":talent]
        case .updateInterest(let intrest):
            return ["interests":intrest]
            
        case.createFeedback(let opportunity_id,let review,let ratings):
            return ["opportunity_id":opportunity_id,"review":review].merging(ratings){(_, new) in new}

        case .getFundType(let opportunitiesid ):
            return ["opportunity_id":opportunitiesid]
        default : return [:]
        }
        
        
    }
    
    
}
