//
//  ApiManager.swift
//  Jejucon
//
//  Created by jwh on 2017. 5. 11..
//  Copyright © 2017년 jwh. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


private let GooglePlaceKey = "AIzaSyA-bS9q_6FKsOm51Hmto_aMJxzR5qszkuU"

class ApiManager{

    
    public func searchGooglePlace(_ text : String){
        var url = "https://maps.googleapis.com/maps/api/place/textsearch/json?"+text+"&"+GooglePlaceKey
        Alamofire.request(url,method:.get).responseJSON { (response) in
            debugPrint(response)
            if let json = response.result.value {
                print("JSON: \(json)")
            }
    }
    }
    
    
    
}
