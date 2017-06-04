//
//  WriteDetail.swift
//  Jejumeet
//
//  Created by jwh on 2017. 6. 4..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit
import GoogleMaps
class WriteDetail: UITableViewController, UITextViewDelegate {
    
    var loca : CLLocationCoordinate2D?
    let apim = APIM()
    @IBOutlet weak var limitLabel: UILabel!
    @IBOutlet weak var limitStep: UIStepper!
    @IBOutlet weak var todo_title: UITextField!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var meeting_date: UIButton!
    var _date : String? = " "{
        willSet(val){
            var datetext = "날짜"
            var arr = val!.components(separatedBy: ":")
            datetext = arr[0]+"-"+arr[1]+"-"+arr[2]+" "+arr[3]+"시"+arr[4]+"분"
            meeting_date.setTitle(datetext, for: UIControlState.normal)
        }
    }
    @IBAction func limitNum(_ sender: UIStepper) {
        limitLabel.text = Int(sender.value).description
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        limitStep.wraps = true
        limitStep.autorepeat = true
        
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if(textView.text=="어떤 즐거운 일을 함께 하시겠어요?"){
            textView.text=""
        }
        textView.becomeFirstResponder()
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if(textView.text==""){
            textView.text="어떤 즐거운 일을 함께 하시겠어요?"
        }
        textView.resignFirstResponder()
    }
    @IBAction func unwindToDetailVC(_ segue: UIStoryboardSegue){
        
    }

    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func regist(_ sender: Any) {
        let ud = UserDefaults.standard
        let user_index = ud.integer(forKey: "user_index")
        print("user_index\(user_index)")
        apim.setApi(path:
            "/addBull", method: .post, parameters: ["user_index":user_index,"bulletin_title":todo_title.text!,"bulletin_content":content.text!,"bulletin_meeting_date":_date!,"bulletin_apply_limit":limitLabel.text!,"bulletin_latitude":loca!.latitude,"bulletin_longitude":loca!.longitude])
        
        apim.reqWriteContent{(success) in
            if success == 1{
                let alert = UIAlertController(title: "등록 하시겠어요?", message: "", preferredStyle: .alert)
                let ok = UIAlertAction(title: "등록", style: .default){
                (_) in
                    self.presentingViewController?.dismiss(animated: true)
                }
                let cancel = UIAlertAction(title: "취소", style: .cancel){(_) in
                    print("취소")
                }
                alert.addAction(ok)
                alert.addAction(cancel)
                self.present(alert, animated: true)
                
            }else{
                NSLog("실패")
            }
        }
    }

    
}
