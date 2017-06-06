//
//  TodoListVC.swift
//  Jejumeet
//
//  Created by jwh on 2017. 5. 14..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit
import Floaty
import GoogleMaps
class TodoListVC: UITableViewController,FloatyDelegate{

    var bulletList : [BuiltIn]! = []{
        willSet(val){
            print("TodoListVC의 bulletList에 셋팅됨")
        }
    }
    var currentidx : Int?
    
    let apim = APIM()
    @IBOutlet var tableV: UITableView!
    @IBOutlet weak var searchingPlaceName: UILabel!
   
    var _searchingPlaceName:String?
    var _searchingPlaceCoordinate:CLLocationCoordinate2D!
    var floaty = Floaty()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        searchingPlaceName.text = _searchingPlaceName
        layoutFAB()
        
    }
    
    func basicAlert(title : String,message : String, _ agree: Bool){
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "네", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
            alertView.dismiss(animated: true, completion: nil)
        })
        
        alertView.addAction(action)
        
        alertWindow(alertView: alertView)
    }
    func alertWindow(alertView: UIAlertController){
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindowLevelAlert + 1
        alertWindow.makeKeyAndVisible()
        alertWindow.rootViewController?.present(alertView, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func backAction(_ sender: Any) {
         self.presentingViewController?.dismiss(animated: true)
    }
    
    func layoutFAB() {

        floaty.addItem("지도로 보기", icon: UIImage(named: "icMap")) {_ in
            self.performSegue(withIdentifier: "googleMapWind", sender: self)
        }
     
        floaty.fabDelegate = self
        floaty.sticky = true
        self.view.addSubview(floaty)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "googleMapWind"{
           let dest = segue.destination
            let tlwmvc = dest as? TodoListWithMapVC
           tlwmvc?.todoList = self.bulletList
           tlwmvc?._location = _searchingPlaceCoordinate
        }
        if segue.identifier == "detailTodoSegueg"{
            let dest = segue.destination
            let tlwmvc = dest as? DetailTodoVC
            tlwmvc?.todo = bulletList[currentidx!]
        }
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bulletList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListCell", for: indexPath) as! TodoListCell
        cell.user_img.image = UIImage(named: "no_Image.png")
        cell.user_name.text = bulletList![indexPath.row].user_name
        cell.bulletin_title.text = bulletList![indexPath.row].builtein_title
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentidx = indexPath.row
        performSegue(withIdentifier: "detailTodoSegueg", sender: self)
        
    }
    
}








