//
//  TomeListVC.swift
//  Jejumeet
//
//  Created by jwh on 2017. 6. 5..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

class TomeListVC: UITableViewController {
    let apim = APIM()
    var toMeList = [applyVO]()
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBOutlet weak var tableVV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
         //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TodoListCell")
        
        var user_index = UserDefaults.standard.integer(forKey: "user_index")
        print(user_index)
        apim.setApi(path: "/searchMyApply/\(user_index)", method: .get, parameters: [:])
        apim.getSearchApply{(myList) in
            self.toMeList = myList
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        return toMeList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TomeListC", for: indexPath) as! TomeListC
        let data = toMeList[indexPath.row]
        var _statustext : String?
       
        if data.apply_status! == 1{
            _statustext = "동행대기"
        }else if data.apply_status! == 0{
            _statustext = "동행승인"
        }
        cell.apply_status.text = _statustext!
        
        
        cell.user_img.image = UIImage(named:"no_Image.png")
        
        cell.user_name.text = data.user_name
       
        cell.message.text = data.apply_message
        
        cell.title.text = data.bulletin_title
        
        cell.apply_time.text = data.apply_date
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = toMeList[indexPath.row]
       
        if data.apply_status != 0 {
        let alert = UIAlertController(title: "동행", message: "함께 하시겠어요?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "수락", style: .default){
            (_) in
            self.apim.setApi(path: "/agreeApply/\(data.bulletin_index!)&\(data.apply_index!)", method: .put, parameters: [:])
            self.apim.agreeAp(meta: {(success) in
                if success == 1{
                print("성공")
                    self.viewDidLoad()
                }
                
            })
            
        }
        let cancel = UIAlertAction(title: "거절", style: .cancel){
            (_) in
            self.apim.setApi(path: "/disagreeApply/\(data.apply_index!)", method: .put, parameters: [:])
            self.apim.disagreeAp(meta: {(success) in
                if success == 1{
                 print("성공")
                    self.viewDidLoad()
                }
                
            })
            
            
            
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        self.present(alert, animated: true)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
