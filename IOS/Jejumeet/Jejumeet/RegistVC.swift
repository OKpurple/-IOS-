//
//  RegistVC.swift
//  Jejumeet
//
//  Created by jwh on 2017. 5. 13..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

class RegistVC: UIViewController {

    @IBOutlet var login_id: UITextField!
    @IBOutlet var login_pw: UITextField!
    @IBOutlet var user_name: UITextField!
   
    @IBAction func next(_ sender: Any) {
        self.performSegue(withIdentifier: "nextRegist", sender: true)
           }
    @IBAction func Home(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextRegist"{
            if(login_id.text! == ""){
                alert("ID를 입력하세요")
            }else if(login_pw.text! == ""){
                alert("PW를 입력하세요")
            }else if(user_name.text! == ""){
                alert("NAME을 입력하세요")
            }else{
                
                let dest = segue.destination
                guard let rvc = dest as? RegistVC1 else{ return }
                
                rvc.login_id = self.login_id.text!
                rvc.login_pw = self.login_pw.text!
                rvc.user_name = self.user_name.text!
                
            }

            
        }
    }
    
    func alert(_ msg: String){
        let alert = UIAlertController(title: "알림", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        let confirm = UIAlertAction(title:"확인",style:UIAlertActionStyle.cancel)
        alert.addAction(confirm)
        self.present(alert,animated: false)

    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bar = self.navigationController?.navigationBar
            
        bar?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar?.shadowImage = UIImage()
        bar?.backgroundColor = UIColor(red: 32/255.0, green: 131/255.0, blue: 155/255.0, alpha: 1)
        bar?.tintColor = UIColor.white
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
        
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
