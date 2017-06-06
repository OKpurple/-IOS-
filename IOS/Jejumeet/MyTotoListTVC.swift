//
//  MyTotoListTVC.swift
//  Jejumeet
//
//  Created by jwh on 2017. 5. 14..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

class MyTotoListTVC: UITableViewController  {

    let apim = APIM()
    var mylist = [Mylist]()
    var user_index = UserDefaults.standard.integer(forKey: "user_index")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MyTodoListTVC시작 useridx = \(user_index)")
        viewInit()
        
    }
   
    override func viewDidAppear(_ animated: Bool) {
        print("MyTodoListTVC시작 useridx = \(user_index)")
        viewInit()
    }
    func viewInit(){
        
        apim.setApi(path: "/searchApply/\(user_index)", method: .get, parameters: [:])
        apim.getMyReqTodo{(list) in
            self.mylist = list
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mylist.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTodoListC", for: indexPath) as! MyTotoListC
        let idx = indexPath.row
        var status_text:String?
        if(mylist[idx].apply_status!==1){
            status_text = "신청중"
        }else if(mylist[idx].apply_status!==0){
            status_text = "동행승낙"
        }
        
        cell.apply_status.text = status_text
        cell.writer_img.image = UIImage(named:mylist[idx].writer_img!)
        var profile_image = cell.writer_img!
        profile_image.layer.borderWidth = 0
        profile_image.layer.masksToBounds = true
        profile_image.layer.cornerRadius = profile_image.frame.height/2
        profile_image.clipsToBounds = true
        
        
        cell.bulletin_title.text = mylist[idx].bulletin_title!
        cell.writer_name.text = mylist[idx].writer_name!
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
