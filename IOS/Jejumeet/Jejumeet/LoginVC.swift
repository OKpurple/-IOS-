//
//  LoginVC.swift
//  Jejumeet
//
//  Created by jwh on 2017. 5. 13..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

class LoginVC: UIViewController ,UITextFieldDelegate ,UITextViewDelegate{

    let apim = APIM()
    
    @IBOutlet weak var login_id: UITextField!
    @IBOutlet weak var login_pw: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
        
      
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
//    override func viewDidAppear(_ animated: Bool) {
//        self.login_id.becomeFirstResponder()
//    }
//    
    
  
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        if(login_id.text == ""){
            
        }else if(login_pw.text == ""){
            
        }else{
            print(login_id.text!,login_pw.text!)
            apim.setApi(path: "/login", method: .post, parameters: ["user_id":login_id.text!,"user_password":login_pw.text!])
           
            apim.reqLogin{(success) in
                print("status = \(success)")
                if success == 1 {
                    
                    self.apim.setApi(path: "/searchMyUser/\(UserDefaults.standard.integer(forKey: "user_index"))", method: .get, parameters: [:])
                    
                    self.apim.getUserInfo{(userVO) in
                         let ad = UIApplication.shared.delegate as? AppDelegate
                         ad?.user = userVO
                    }
                    
                    self.performSegue(withIdentifier: "loginSegue", sender: self)
                }else{
                    self.basicAlert(title: "오류!", message: "아이디, 비밀번호를 확인해주세요.", false)
                }
                
                
            }
            
        }
        
    }
    
    func basicAlert(title : String,message : String, _ agree: Bool){
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "네", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
            alertView.dismiss(animated: true, completion: nil)
        })
        
        alertView.addAction(action)
        
        alertWindow(alertView: alertView)
    }
    func alertWindow(alertView: UIAlertController){
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindowLevelAlert + 1
        alertWindow.makeKeyAndVisible()
        alertWindow.rootViewController?.present(alertView, animated: true, completion: nil)
    }
    
    

   
}
