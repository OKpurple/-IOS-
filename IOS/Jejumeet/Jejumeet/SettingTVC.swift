//
//  SettingTVC.swift
//  Jejumeet
//
//  Created by jwh on 2017. 5. 14..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

class SettingTVC: UITableViewController {

    @IBOutlet weak var profile_image: UIImageView!
    @IBOutlet weak var profile_name: UILabel!
    
    let apim = APIM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        profile_image.image = UIImage(named: "no_Image.png")
        profile_image.layer.borderWidth = 0
        profile_image.layer.masksToBounds = true
        profile_image.layer.cornerRadius = profile_image.frame.height/2
        profile_image.clipsToBounds = true
        profile_name.text = ad?.user.user_name!
       
    }
    override func viewDidAppear(_ animated: Bool) {
        print("setting시작 useridx = \(UserDefaults.standard.integer(forKey: "user_index"))")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("setting끝 useridx = \(UserDefaults.standard.integer(forKey: "user_index"))")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택행은 \(indexPath.row)")
        
        
        if(indexPath.row == 2){
            let alert = UIAlertController(title: "로그아웃 하실래요?", message: "", preferredStyle: .alert)
            let ok = UIAlertAction(title: "로그아웃", style: .default){
                (_) in
                let ud = UserDefaults.standard
                ud.removeObject(forKey: "user_index")
                self.presentingViewController?.dismiss(animated: true)
            }
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            alert.addAction(ok)
            alert.addAction(cancel)
            self.present(alert, animated: true)
          
        }
    }

  

}
