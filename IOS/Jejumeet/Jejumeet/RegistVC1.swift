//
//  RegistVC1.swift
//  Jejumeet
//
//  Created by jwh on 2017. 5. 31..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit
import SwiftyJSON
class RegistVC1: UIViewController {
    var login_id:String = ""
    var login_pw:String = ""
    var user_name:String = ""
    var _sex:String! = "M"
    var _age:String! = "0"
    let apim = APIM()
    
    @IBOutlet var Tel: UITextField!
    @IBOutlet var Mail: UITextField!
    @IBOutlet var Age: UILabel!
    @IBOutlet var Sex: UISegmentedControl!
    @IBOutlet var AgeStepper: UIStepper!
   
    
    @IBAction func ageValuedChange(_ sender: UIStepper) {
         Age.text = Int(sender.value).description
    }
    
    @IBAction func SexSegment(_ sender: UISegmentedControl) {
        switch Sex.selectedSegmentIndex{
        case 0:
            _sex = "M"
        case 1:
            _sex = "W"
        default:
            _sex = "M"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AgeStepper.wraps = true
        AgeStepper.autorepeat = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Regist(_ sender: Any) {
        if(Tel.text == ""){
            let alert = UIAlertController(title: "알림", message: "연락처를 기재하세요", preferredStyle: UIAlertControllerStyle.alert)
            let confirm = UIAlertAction(title:"확인",style:UIAlertActionStyle.cancel)
            alert.addAction(confirm)
            self.present(alert,animated: false)

        }else if(Mail.text == ""){
            let alert = UIAlertController(title: "알림", message: "메일주소를 기재하세요", preferredStyle: UIAlertControllerStyle.alert)
            let confirm = UIAlertAction(title:"확인",style:UIAlertActionStyle.cancel)
            alert.addAction(confirm)
            self.present(alert,animated: false)

        }else{
            
            print ("login_id = \(login_id), login_pw = \(login_pw), user_name = \(user_name), user_age = \(Age.text!), user_tel = \(Tel.text!)")
                
                
            apim.setApi(path: "/addUser", method: .post, parameters: ["user_password":login_pw,"user_id":login_id,"user_name":user_name,"user_sex":_sex,"user_age":Age.text!,"user_tel":Tel.text!,"user_email":Mail.text!])
            apim.reqRegistUser()
            
            self.present(UIAlertController(title: "알림", message: "회원 가입이 완료되었습니다", preferredStyle: .alert), animated: true)
            self.presentingViewController?.dismiss(animated: true)
            
        }
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
