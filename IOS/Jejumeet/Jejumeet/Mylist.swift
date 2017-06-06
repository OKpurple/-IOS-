//
//  Mylist.swift
//  Jejumeet
//
//  Created by jwh on 2017. 6. 5..
//  Copyright © 2017년 jwh. All rights reserved.
//

import Foundation
class Mylist{
    var apply_index:Int?
    
    
    var user_index :Int?
    
    var bulletin_index : Int?
    var bulletin_title : String?
    var apply_status : Int?
    
    var apply_message : String?
    
    var apply_date : String?
    var writer_img : String?
    var writer_name:String?
    
    init(user_index:Int?, bulletin_index:Int?,bulletin_title:String?, apply_status:Int?, apply_message : String?,apply_date:String?,writer_img:String?,writer_name:String?){
        self.user_index = user_index
        self.bulletin_index = bulletin_index
        self.bulletin_title = bulletin_title
        self.apply_message = apply_message
        self.apply_date = apply_date
        self.apply_status = apply_status
        self.writer_img = writer_img
        self.writer_name = writer_name
    }
    
}
