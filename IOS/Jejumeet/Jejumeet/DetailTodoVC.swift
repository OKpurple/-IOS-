//
//  DetailTodoVC.swift
//  Jejumeet
//
//  Created by jwh on 2017. 5. 14..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

class DetailTodoVC: UIViewController {

    
    @IBOutlet weak var user_img: UIImageView!
    @IBOutlet weak var todoTitle: UILabel!
    @IBOutlet weak var todo_date: UILabel!
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var user_sex: UILabel!
    @IBOutlet weak var user_age: UILabel!
    @IBOutlet weak var todo_content: UITextView!
    
    
    var todo : BuiltIn?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        user_img.image = UIImage(named:"no_image.png")
        user_img.layer.borderWidth = 0
        user_img.layer.masksToBounds = true
        user_img.layer.cornerRadius = user_img.frame.height/2
        user_img.clipsToBounds = true
        
        todoTitle.text = todo!.builtein_title
        
        var str = "::::"
        str = todo!.builtein_meeting_date!
        var arr = str.components(separatedBy: ":")
        var _arr = arr[0]+"-"+arr[1]+"-"+arr[2]+" "+arr[3]+":"+arr[4]
        todo_date.text = _arr
        
        todo_content.text = todo!.builtein_content
        user_name.text = todo!.user_name
        user_sex.text = todo!.user_sex
        user_age.text = todo!.user_age
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    


}
