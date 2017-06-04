//
//  BuiltIn.swift
//  Jejumeet
//
//  Created by jwh on 2017. 6. 3..
//  Copyright © 2017년 jwh. All rights reserved.
//

import Foundation
class BuiltIn: NSObject{
    
    public var user_index : Int?
    public var user_name : String?
    public var user_id : String?
    public var user_password : String?
    public var user_sex : String?
    public var user_age : String?
    public var user_reliability : Int?
    public var user_img : String?
    public var user_tel : String?
    public var user_email : String?
    public var builtein_index : Int?
    public var builtein_title : String?
    public var builtein_content : String?
    public var builtein_latitude : Double?
    public var builtein_longitude : Double?
    public var builtein_reg_date : String?
    public var builtein_meeting_date : String?
    public var builtein_img : String?
    public var builtein_apply_limit : Int?
    public var builtein_apply_status : Int?
    public var builtein_status : Int?
    
    init(user_index:Int?, user_name:String?,user_id:String?, user_password : String?,user_sex : String?,user_age : String?
        ,user_reliability : Int?,user_img : String?,user_tel : String?,user_email : String?,
         builtein_index : Int?,builtein_title : String?,builtein_content : String?,builtein_latitude :Double?,builtein_longitude : Double?,builtein_reg_date : String?, builtein_meeting_date : String?,builtein_img : String?,builtein_apply_limit : Int?,builtein_apply_status : Int?,builtein_status : Int?){
        self.user_index = user_index
        self.user_name = user_name
        self.user_id = user_id
        self.user_password = user_password
        self.user_sex = user_sex
        self.user_age=user_age
        self.user_reliability = user_reliability
        self.user_img = user_img
        self.user_tel = user_tel
        self.user_email = user_email
        self.builtein_title = builtein_title
        self.builtein_index = builtein_index
        self.builtein_content = builtein_content
        self.builtein_latitude = builtein_latitude
        self.builtein_longitude = builtein_longitude
        self.builtein_reg_date = builtein_reg_date
        self.builtein_meeting_date = builtein_meeting_date
        self.builtein_img = builtein_img
        self.builtein_apply_limit = builtein_apply_limit
        self.builtein_apply_status = builtein_apply_status
    }
    
}
