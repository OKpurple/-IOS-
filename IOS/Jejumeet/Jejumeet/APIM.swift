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
    
    func reqLogin(meta: @escaping(Int)->Void){
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
    
    
    
}
