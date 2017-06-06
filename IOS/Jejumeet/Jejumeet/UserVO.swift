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
    var user_sex : String?
    var user_age : String?
    var user_tel : String?
    var user_email : String?
    var user_password : String?
    
    init(user_index : Int?, user_id : String?, user_name : String?, user_img : String?,user_sex:String?,user_age : String?, user_tel:String?,user_email:String?,user_password:String?){
        self.user_name = user_name
        self.user_id = user_id
        self.user_img = user_img
        self.user_index = user_index
        self.user_age = user_age
        self.user_sex = user_sex
        self.user_tel = user_tel
        self.user_password = user_password
        self.user_email = user_email
    }
}
