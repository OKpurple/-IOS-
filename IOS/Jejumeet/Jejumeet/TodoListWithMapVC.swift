//
//  TodoListWithMapVC.swift
//  Jejumeet
//
//  Created by jwh on 2017. 5. 14..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit
import GoogleMaps
class TodoListWithMapVC: UIViewController,GMSMapViewDelegate {

    var _location : CLLocationCoordinate2D!{
        willSet(val){
            NSLog("새로들어올 위치는 \(val)")
        }
    }
    
    var todoList : [BuiltIn] = []
    var currentTodo : BuiltIn?
    @IBOutlet var footerLabel: UILabel!
    
    var footerdata:String?{
        didSet{
            print(footerdata!)
            self.footerLabel?.text = footerdata!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        footerLabel.text = ""
        // Do any additional setup after loading the view.
        let camera = GMSCameraPosition.camera(withLatitude: (_location?.latitude)!, longitude: (_location?.longitude)!, zoom: 13.0)
        let mapView = GMSMapView.map(withFrame: CGRect(x:0,y:64,width:375,height:667), camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.isMyLocationEnabled = true
        mapView.settings.zoomGestures = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.delegate = self
        
        
        for idx in 0 ..< todoList.count{
           
            let position = CLLocationCoordinate2D(latitude: todoList[idx].builtein_latitude!, longitude: todoList[idx].builtein_longitude!)
            let marker = GMSMarker(position: position)
            marker.title = todoList[idx].builtein_title
            marker.snippet = todoList[idx].user_name
            marker.userData = todoList[idx]
            print("userdata\(todoList[idx].builtein_index!)")
            marker.map = mapView
        }
        
        
        
        self.view.addSubview(mapView)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        NSLog("todolistwithmapVC 세그 시작")
        
        if segue.identifier == "detailTodo"{
        let dest = segue.destination
        guard let rvc = dest as? DetailTodoVC else{
            return
            }
        rvc.todo = currentTodo
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print (marker.title!)
        currentTodo = marker.userData as! BuiltIn
       
        performSegue(withIdentifier: "detailTodo", sender: self)
    }
    
   
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
        //footerLabel.text = "new Thing"
        
    }

}

