//
//  APIM.swift
//  Jejumeet
//
//  Created by jwh on 2017. 6. 1..
//  Copyright © 2017년 jwh. All rights reserved.
//
import Alamofire
import SwiftyJSON
import Foundation

class APIM{
    private let server = "http://52.15.178.227:9000"
    
    private var url: String!
    private var method: HTTPMethod!
    private var parameters: Parameters!
    private var header: HTTPHeaders!
    private let encode = URLEncoding.default
    
    public func setApi(path: String, method: HTTPMethod, parameters: Parameters){
        
        self.url = server + path
        self.method = method
        self.parameters = parameters
        //self.header = header
    }
    
    func reqRegistUser(){
        Alamofire.request(url,method: method, parameters: parameters, encoding: encode).responseJSON { (response) in
            switch(response.result){
            case .success(_):
                if let json = response.result.value{
                    let resp = JSON(json)
                    print(resp)
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    func reqWriteContent(meta: @escaping(Int)->Void){
        print("url:\(url), method:\(method), parameters:\(parameters),encode:\(encode)")
        
        Alamofire.request(url,method: method, parameters: parameters, encoding: encode).responseJSON { (response) in
            switch(response.result){
            case .success(_):
                if let json = response.result.value{
                    let resp = JSON(json)
                    print(resp)
                    meta(resp["success"].intValue)
                }
                break
            case .failure(_):
                print("fail")
                break
            }
        }
    }
    
    func reqLogin(meta: @escaping(Int)->Void){
        print("url:\(url), method:\(method), parameters:\(parameters),encode:\(encode)")
            
        Alamofire.request(url,method: method, parameters: parameters, encoding: encode).responseJSON { (response) in
            switch(response.result){
            case .success(_):
                if let json = response.result.value{
                    let resp = JSON(json)
                    print(resp)
                    var user_index = resp["data"][0]["user_index"].intValue
                    print(user_index)
                    let ud = UserDefaults.standard
                    ud.set(user_index,forKey:"user_index")
                    meta(resp["success"].intValue)
                }
                break
            case .failure(_):
                print("fail")
                break
            }
        }
    }
    
    func getTotoList(completion: @escaping([BuiltIn])->Void){
        print("url:\(url), method:\(method), parameters:\(parameters),encode:\(encode)")
        
        Alamofire.request(url,method: method, parameters: parameters, encoding: encode).responseJSON { (response) in
            switch(response.result){
            case .success(_):
                if let json = response.result.value{
                    let resp = JSON(json)
                    print(resp)
                    var builteInList = [BuiltIn]()
                    for idx in 0..<resp["data"].count{
                        let builteIn = BuiltIn(user_index: resp["data"][idx]["user_index"].intValue, user_name:resp["data"][idx]["user_name"].stringValue,user_id:resp["data"][idx]["user_id"].stringValue, user_password: resp["data"][idx]["user_password"].stringValue, user_sex:resp["data"][idx]["user_sex"].stringValue, user_age:resp["data"][idx]["user_age"].stringValue, user_reliability:resp["data"][idx]["user_reliability"].intValue, user_img: resp["data"][idx]["user_img"].stringValue, user_tel: resp["data"][idx]["user_tel"].stringValue, user_email: resp["data"][idx]["user_email"].stringValue, builtein_index: resp["data"][idx]["bulletin_index"].intValue, builtein_title: resp["data"][idx]["bulletin_title"].stringValue, builtein_content: resp["data"][idx]["bulletin_content"].stringValue, builtein_latitude: resp["data"][idx]["bulletin_latitude"].doubleValue, builtein_longitude: resp["data"][idx]["bulletin_longitude"].doubleValue, builtein_reg_date: resp["data"][idx]["bulletin_reg_date"].stringValue, builtein_meeting_date: resp["data"][idx]["bulletin_meeting_date"].stringValue, builtein_img: resp["data"][idx]["bulletin_img"].stringValue, builtein_apply_limit: resp["data"][idx]["bulletin_apply_limit"].intValue, builtein_apply_status: resp["data"][idx]["bulletin_apply_status"].intValue, builtein_status: resp["data"][idx]["bulletin_status"].intValue)
                        
                            
                            builteInList += [builteIn]
                    }
        
                    completion(builteInList)
                }
                break
            case .failure(_):
                print("fail")
                break
            }
            
        }
    }
    

    
}
