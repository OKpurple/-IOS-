//
//  WriteTodoVC.swift
//  Jejumeet
//
//  Created by jwh on 2017. 5. 16..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import GooglePlacePicker

class WriteTodoVC: UIViewController,GMSMapViewDelegate  {


    
    var camera = GMSCameraPosition.camera(withLatitude: 33.500696, longitude: 126.529484,zoom: 10.0)
        
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    var currentCoordi : CLLocationCoordinate2D?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self as! GMSAutocompleteResultsViewControllerDelegate
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        
        let subView = UIView(frame: CGRect(x: 0, y: 206, width: 376.0, height: 45.0))
        
        subView.addSubview((searchController?.searchBar)!)
        view.addSubview(subView)
        searchController?.searchBar.sizeToFit()
        searchController?.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        
        
        
        
            mapviewload()

    }
   
    
    func mapviewload(){
       
        let mapView = GMSMapView.map(withFrame: CGRect(x:0,y:250,width:376,height:300), camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.isMyLocationEnabled = true
        mapView.settings.zoomGestures = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.delegate = self
        self.view.addSubview(mapView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        print(coordinate)
        let position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let marker = GMSMarker(position: position)
        marker.title = "나의 일정"
        marker.map = mapView
        currentCoordi = coordinate
        
        let alert = UIAlertController(title: "일정을 공유하시겠어요?", message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title:"확인",style:.default){
            (_) in
            mapView.clear()
            self.performSegue(withIdentifier: "writeDetailSegue", sender: self)
            print(coordinate)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel){(_) in
            mapView.clear()
            print("취소")
        }
        self.present(alert,animated: false)
        alert.addAction(ok)
        alert.addAction(cancel)
   
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="writeDetailSegue"){
            let rvc = segue.destination as! WriteDetail
            rvc.loca = currentCoordi
        }
    }
}


extension WriteTodoVC: GMSAutocompleteResultsViewControllerDelegate {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didAutocompleteWith place: GMSPlace) {
        searchController?.isActive = false
        // Do something with the selected place.
        print("Place name: \(place.name)")
        
        
        self.camera = GMSCameraPosition.camera(withLatitude: place.coordinate.latitude, longitude: place.coordinate.longitude, zoom: 13.0)
        viewDidLoad()
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didFailAutocompleteWithError error: Error){
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
