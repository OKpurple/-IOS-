//
//  applyVO.swift
//  Jejumeet
//
//  Created by jwh on 2017. 6. 5..
//  Copyright © 2017년 jwh. All rights reserved.
//

import Foundation

class applyVO{
    var apply_index : Int?
    var bulletin_index : Int?
    var apply_message : String?
    var apply_date : String?
    var user_name : String?
    var user_tel : String?
    var user_img : String?
    var bulletin_title : String?
    var bulletin_img : String?
    var apply_status : Int?
    
    init(apply_index : Int?,bulletin_index : Int?,apply_message : String?,apply_date : String?,user_name : String?,user_tel : String?,user_img : String?, bulletin_title : String?,bulletin_img : String?,apply_status : Int?){
        
        self.apply_date = apply_date
        self.bulletin_img = bulletin_img
        self.bulletin_index = bulletin_index
        self.apply_index = apply_index
        self.apply_message = apply_message
        self.user_name = user_name
        self.user_img = user_img
        self.user_tel = user_tel
        self.bulletin_title = bulletin_title
        self.apply_status = apply_status
    }
    
    
}
