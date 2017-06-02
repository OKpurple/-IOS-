//
//  detailVC.swift
//  Jeju
//
//  Created by jwh on 2017. 5. 4..
//  Copyright © 2017년 jwh. All rights reserved.
//
import GoogleMaps
import UIKit

class detailVC: UIViewController , GMSMapViewDelegate{
    
    var mapView:GMSMapView?
    var marker = GMSMarker()
    var s_title : String = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        
        
        mapView = GMSMapView.map(withFrame: CGRect(x: 50, y: 50, width: 250, height: 250), camera: GMSCameraPosition.camera(withLatitude: 51.050657, longitude: 10.649514, zoom: 5.5))
        mapView?.delegate = self
        //so the mapView is of width 200, height 200 and its center is same as center of the self.view
        
       
        //marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        
        //marker.snippet = "Australia"
        //marker.appearAnimation = kGMSMarkerAnimationPop
        //marker.map = mapView

        
        
        
        //mapView?.center = self.view.center
        
        
        
        self.view.addSubview(mapView!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        marker.title = "My"
        marker.snippet = "new one"
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.map = mapView
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        s_title = marker.title!;
        print(marker.title!);
        return true;
    }
    
    
    @IBAction func detailbtn(_ sender: Any) {
       self.performSegue(withIdentifier: "segDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let send = segue.destination as? ViewController{
            send._tt = s_title;
        }
    }
    
    
   
    


    @IBOutlet weak var gmView: GMSMapView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
