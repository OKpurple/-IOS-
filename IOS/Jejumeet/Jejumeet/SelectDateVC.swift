//
//  SelectDateVC.swift
//  Jejumeet
//
//  Created by jwh on 2017. 5. 14..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

class SelectDateVC: UIViewController {

    @IBOutlet weak var _DatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       _DatePicker.setValue(UIColor.white, forKeyPath: "textColor")
       _DatePicker.datePickerMode = UIDatePickerMode.dateAndTime
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy:MM:dd:hh:mm"
        let time = dateFormatter.string(from: _DatePicker.date)
        print("시간은 \(time)")
        
        
        let dest = segue.destination
        print(dest)
        guard let rvc = dest as? WriteDetail else{
            return
        }
        
        rvc._date = time
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
