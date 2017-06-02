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
    
    @IBOutlet var footerLabel: UILabel!
    
    var footerdata:String?{
        didSet{
            print(footerdata!)
            self.footerLabel?.text = footerdata!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        footerLabel.text = ""
        // Do any additional setup after loading the view.
        let camera = GMSCameraPosition.camera(withLatitude: (_location?.latitude)!, longitude: (_location?.longitude)!, zoom: 13.0)
        let mapView = GMSMapView.map(withFrame: CGRect(x:0,y:64,width:375,height:410), camera: camera)
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
    
    @IBAction func DetailAction(_ sender: Any) {
//        guard let detaily = self.storyboard?.instantiateViewController(withIdentifier: "DetailId") as? DetailTodoVC else {
//            return
//        }
//        
//        detaily.text = "new text"
        
        
        self.performSegue(withIdentifier: "DetailTodoSegue", sender: sender)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        NSLog("todolistwithmapVC 세그 시작")
        
        if segue.identifier == "DetailTodoSegue"{
        let dest = segue.destination
        guard let rvc = dest as? DetailTodoVC else{
            return
            }
            rvc.text = "new Text"
        }//else if segue.identifier == "embededGoogleMap"{
//            
//            let dest = segue.destination
//            let mapvc = dest as? GoogleMapVC
//            NSLog("로케이션은? \(_location)")
//            mapvc?.searchLocation = _location
//        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
        footerLabel.text = "new Thing"
        
    }

}
