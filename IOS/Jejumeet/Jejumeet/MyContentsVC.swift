//
//  MyContentsVC.swift
//  Jejumeet
//
//  Created by jwh on 2017. 6. 4..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

class MyContentsVC: UITableViewController {

    @IBOutlet var tableV: UITableView!
    var bulletList : [BuiltIn]! = []{
        didSet(val){
            print("들어옵니다 \(val)")
            print(val.count)
        }
    }

    var currentidx : Int?
    let apim = APIM()
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ud = UserDefaults.standard
        let user_index = ud.integer(forKey: "user_index")
        print("\(user_index)의 글보기")
        
        tableV.delegate = self;
        tableV.dataSource = self;
       
        self.apim.setApi(path: "/searchMyBull/\(user_index)", method: .get, parameters: [:])
        self.apim.reqMyTodo{(myList) in
            self.bulletList = myList
            self.tableV.reloadData()
        }
      
        
        
        
       
       
    }

    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.bulletList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentidx = indexPath.row
        performSegue(withIdentifier: "myDetail", sender: self)
    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListCell1", for: indexPath) as! TodoListCell
//        cell.user_img.image = UIImage(named: "no_Image.png")
//        cell.user_name.text = bulletList![indexPath.row].user_name
//        cell.bulletin_title.text = bulletList![indexPath.row].builtein_title
//        return cell
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "myDetail"){
            let rvc = segue.destination as? DetailTodoVC
            rvc?.todo = bulletList[currentidx!]
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListCell1", for: indexPath) as! TodoListCell
        cell.user_img.image = UIImage(named: "no_Image.png")
        cell.user_name.text = bulletList![indexPath.row].user_name
        cell.bulletin_title.text = bulletList![indexPath.row].builtein_title
        return cell
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
