//
//  UserVO.swift
//  Jejumeet
//
//  Created by jwh on 2017. 6. 5..
//  Copyright © 2017년 jwh. All rights reserved.
//

import Foundation


class UserVO{
    
    
    var user_index : Int?
    var user_id : String?
    var user_name : String?
    var user_img: String?
    
    init(user_index : Int?, user_id : String?, user_name : String?, user_img : String?){
        self.user_name = user_name
        self.user_id = user_id
        self.user_img = user_img
        self.user_index = user_index
        
    }
}
