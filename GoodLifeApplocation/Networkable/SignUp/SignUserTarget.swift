//
//  SignUserTarget.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 28/08/2022.
//

import Foundation
import Moya
enum SignUserTarget:TargetType{
    
    case SignUp(mobile:String)
    case resendCode(mobile:String)
    case checkCode(mobile:String,code:String)
    case startFundRaise(latitude:String,longitude:String,work_type:String,amount_raise:Float)
    
    var baseURL: URL {
        return URL(string: "\(AppConfig.apiBaseUrl)")!
    }
  
    var path: String {
        switch self {
        case .SignUp:return "signUpUsers"
        case .resendCode: return "reSendCode"
        case .checkCode:return "checkCode"
        case .startFundRaise: return "startFundRaise"
            
        }
    }
    var method: Moya.Method {
        switch self{
        case .SignUp,.resendCode,.checkCode,.startFundRaise:
            return .post
       
        }
    }
    
    var task: Task{
        switch self{
            
        case .SignUp,.resendCode,.checkCode,.startFundRaise:
            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)
        }
    }
    
    
    var headers: [String : String]?{
        switch self{
        case .SignUp,.startFundRaise:
            do {
                let token = try KeychainWrapper.get(key: AppData.email) ?? ""
                return ["Authorization":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijc1NzFjZWI3NjUyNmQ0MjdkODRhMGExZmQzOWU3YTE0NTVjNWI4MmM2OTFiNTViOWQ4NTIyNmYzZjUxOTVhMTU0NzdmNjdkYzY0Njk5MWU3In0.eyJhdWQiOiIxIiwianRpIjoiNzU3MWNlYjc2NTI2ZDQyN2Q4NGEwYTFmZDM5ZTdhMTQ1NWM1YjgyYzY5MWI1NWI5ZDg1MjI2ZjNmNTE5NWExNTQ3N2Y2N2RjNjQ2OTkxZTciLCJpYXQiOjE2NjE5NDA2NjAsIm5iZiI6MTY2MTk0MDY2MCwiZXhwIjoxNjkzNDc2NjYwLCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.M5WQx9pm9QplzaQnUpP96QP89EzXYC9_zq_wQgMICmH37SGmq1Q-FPEtzJHRGc79nufER5vd_TIOFAAY9kA6CN1_xhe1Wxl5AnN8kFEp_2PKuvtsh2Ie8WoaUcFEFup9pVLmlYGKhAsAG5v4iChzsDlKWsOkuv9DE8VBoPTyXBjbmKavoMIMzgzK1qKrG5N1CpkRdladslsWvMSa6K_JwI5FnFqCa4eWjPpGavV9LbS2imWs0evUvUvN9RTp6b4GFERJAaHBxwClsxtRKHwX6XGIOhj95BS27SeMm_NbD8pWJ9t4ORtf5Mo7YmEgSLNPhRM5JybSHEXWCUIlZKHmS-YXoPxsNdE664l8ESlLHE05XYXV7B0O8jKpRjm7Szu5teCukzqrlzpFsQDVFHt6jiDZe2NJ_fyXIBbEi25_nnaN7Z6AXLmvNH1KbSCj7pua3Cg9_jewgnXbHxuB-U01vF1KeZY8aKofO7K2u8ILLrnMGuexdnAPrevvVa6F13-y7r_IFDRonX7twe0LEsd1QpAJ3VdyzJcqfJqsbRkcfqyeYeBc3ZNIAuqxwOwxf3mNzsr2Mm_tKJ6sWf9OSzqxNJfeXwfJVXARj8mU4dTqVtgWAZamGE6bB7HIKfEQFlTHTibjd3-KcorCuWvWIJjp66BcqgvS2zyYh3UJLlJKCmQ" ,"Accept":"application/json","Accept-Language":"en"]
            }
            catch{
                return ["Accept":"application/json","Accept-Language":"en"]
            }
        case .resendCode,.checkCode:
            return ["Accept":"application/json","Accept-Language":"en"]

        }
    }
    
    var param: [String : Any]{
        
        
        switch self {
        case .SignUp(let mobile):
            return ["mobile":mobile]
        case .resendCode(let mobile):
            return ["mobile":mobile]
        case .checkCode( let mobile,let code):
            return ["mobile":mobile,"code":code]

        case .startFundRaise(let latitude,let longitude, let work_type,let amount_raise):
            return ["latitude":latitude,"longitude":longitude,"work_type":work_type,"amount_raise":amount_raise]

        }
        
        
    }
}
