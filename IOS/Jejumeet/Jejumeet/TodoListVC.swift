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

    
    @IBOutlet weak var searchingPlaceName: UILabel!
    var _searchingPlaceName:String?
    var _searchingPlaceCoordinate:CLLocationCoordinate2D!
    
    var floaty = Floaty()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchingPlaceName.text = _searchingPlaceName
        
        print("lat : \(String(describing: _searchingPlaceCoordinate?.latitude)), lng : \(String(describing: _searchingPlaceCoordinate?.longitude))")
        layoutFAB()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func backAction(_ sender: Any) {
         self.presentingViewController?.dismiss(animated: true)
    }
    
    func layoutFAB() {
        //let item = FloatyItem()
//        item.buttonColor = UIColor.blue
//        item.circleShadowColor = UIColor.red
//        item.titleShadowColor = UIColor.blue
//        item.title = "Custom item"
//        item.handler = { item in
//            
//        }
        //floaty.addItem(item: item)
        //floaty.addItem(title: "I got a title")
        //floaty.addItem("I got a icon", icon: UIImage(named: "icShare"))
        floaty.addItem("지도로 보기", icon: UIImage(named: "icMap")) {_ in
            self.performSegue(withIdentifier: "googleMapWind", sender: self)
        }
        
        floaty.fabDelegate = self
        
        self.view.addSubview(floaty)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "googleMapWind"{
           let dest = segue.destination
           let tlwmvc = dest as? TodoListWithMapVC
           tlwmvc?._location = _searchingPlaceCoordinate
        }
    }
   
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
