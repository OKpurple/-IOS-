//
//  ViewController.swift
//  Jeju
//
//  Created by jwh on 2017. 5. 3..
//  Copyright © 2017년 jwh. All rights reserved.
//
import GoogleMaps
import UIKit


class ViewController: UIViewController, GMSMapViewDelegate {
    var _tt : String = "";
    var tt : String{
        get{
            return _tt;
        } set(valu){
            _tt = valu;
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        text.text = _tt;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
   
    
    @IBOutlet weak var text: UITextField!
        
        
   
    
    

    
}

