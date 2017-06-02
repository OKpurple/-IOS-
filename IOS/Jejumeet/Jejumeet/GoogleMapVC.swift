//
//  GoogleMapVC.swift
//  Jejumeet
//
//  Created by jwh on 2017. 5. 14..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import GooglePlacePicker

class GoogleMapVC: UIViewController , GMSMapViewDelegate{
    var searchLocation : CLLocationCoordinate2D?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("googlemapv 시작 location = \(searchLocation)")
    
        
        let camera = GMSCameraPosition.camera(withLatitude: (searchLocation?.latitude)!, longitude: (searchLocation?.longitude)!, zoom: 13.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.zoomGestures = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.delegate = self
        self.view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
//        var locationManager:CLLocationManager!
//        var mapView : GMSMapView?
//        
//        locationManager = CLLocationManager()
//        // locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization() //권한 요청
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.startUpdatingLocation()
//        
//        
//        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: GMSCameraPosition.camera(withLatitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!, zoom: 6.0))
//        mapView?.isMyLocationEnabled = true
//        mapView?.isMyLocationEnabled = true
//        mapView?.settings.myLocationButton = true;
//        mapView?.settings.compassButton = true;
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
        let parent = self.storyboard?.instantiateViewController(withIdentifier: "TDMmain") as? TodoListWithMapVC
        parent?.footerdata = "NO!!!"
        
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
