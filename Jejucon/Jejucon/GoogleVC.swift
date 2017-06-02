//
//  GoogleVC.swift
//  Jejucon
//
//  Created by jwh on 2017. 5. 10..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import GooglePlaces
import GooglePlacePicker


class GoogleVC: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate,FloatyDelegate {
    var fab = Floaty()

    
    

 
    var mapView : GMSMapView?
    var locationManager:CLLocationManager!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutFAB()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //권한 요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
       
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: GMSCameraPosition.camera(withLatitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!, zoom: 6.0))
        mapView?.isMyLocationEnabled = true
        mapView?.isMyLocationEnabled = true
        mapView?.settings.myLocationButton = true;
        mapView?.settings.compassButton = true;
        
        self.view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
       // self.view.addSubview(mapView!)
    }
    
    
    
    func layoutFAB() {
        let item = FloatyItem()
        item.buttonColor = UIColor.blue
        item.circleShadowColor = UIColor.red
        item.titleShadowColor = UIColor.blue
        item.title = "Custom item"
        item.handler = { item in
        }
        
        fab.addItem(title: "I got a title")
        // fab.addItem("I got a icon", icon: UIImage(named: "icShare"))
        //        fab.addItem("I got a handler", icon: UIImage(named: "icMap")) { item in
        //            let alert = UIAlertController(title: "Hey", message: "I'm hungry...",     preferredStyle: .alert)
        //            alert.addAction(UIAlertAction(title: "Me too", style: .default, handler: nil))
        //            self.present(alert, animated: true, completion: nil)
        //            self.fab.close()
        //        }
        //        fab.addItem(item: item)
        fab.sticky = true
        
        fab.fabDelegate = self
        
        //    print(tableView!.frame)
        
        self.view.addSubview(fab)
    }
    
    func floatyOpened(_ floaty: Floaty) {
        print("Floaty Opened")
    }
    
    func floatyClosed(_ floaty: Floaty) {
        print("Floaty Closed")
    }

    
    
    
    
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
