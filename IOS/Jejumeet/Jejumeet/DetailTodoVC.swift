//
//  DetailTodoVC.swift
//  Jejumeet
//
//  Created by jwh on 2017. 5. 14..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit
import GoogleMaps
class DetailTodoVC: UITableViewController {

    
    

    
    
    var todo : BuiltIn?
    
    @IBOutlet weak var todo_content: UITextView!
    @IBOutlet weak var todoTitle: UILabel!
    @IBOutlet weak var todo_status: UILabel!
    @IBOutlet weak var apply_limit: UILabel!
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var user_img: UIImageView!
    @IBOutlet weak var user_sex: UILabel!
    @IBOutlet weak var user_age: UILabel!
    @IBOutlet weak var meeting_date: UILabel!
   
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
        meeting_date.text = _arr
        
        todo_content.text = todo!.builtein_content
        
        user_name.text = todo!.user_name
        user_sex.text = todo!.user_sex
        user_age.text = todo!.user_age
        
        var limit = todo!.builtein_apply_limit
        
        self.apply_limit.text = limit?.description
        
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "containMap"{
            var vcmap = segue.destination as?GoogleMapVC
        let posi = CLLocationCoordinate2D(latitude: (todo?.builtein_latitude)!, longitude: (todo?.builtein_longitude)!)
        print("detailTodoVC 프리페어 + \(posi)")
        vcmap?.searchLocation = posi
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    


}
