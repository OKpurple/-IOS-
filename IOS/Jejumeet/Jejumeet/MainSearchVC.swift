//
//  MainSearchVC.swift
//  Jejumeet
//
//  Created by jwh on 2017. 5. 13..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit
import GooglePlaces

class MainSearchVC: UIViewController {
    
    
    var bulletList : [BuiltIn]! = []{
        willSet(val){
            print("들어옵니다 \(val)")
            print(val.count)
            print(bulletList.count)
        }
    }
    
    
    let apim = APIM()
    
    var datetext : String = "날짜"
    var _date : String = "" {
        willSet(val){
            var arr = val.components(separatedBy: ":")
            datetext = arr[0]+"-"+arr[1]+"-"+arr[2]+" "+arr[3]+":"+arr[4]
        }
    }
    var _place : String = "장소"{
        willSet(val){
            print("장소 바뀜 \(val)")
        }
    }
    var _coordinate : CLLocationCoordinate2D?
    
    override func viewWillAppear(_ animated: Bool) {
        
        searchButton.setTitle(_place, for: UIControlState.normal)
        //date.setTitle(datetext, for: UIControlState.normal)
    }
    
    @IBAction func unwindToMainVC(_ segue: UIStoryboardSegue){
        
    }
    
    @IBOutlet var searchButton: UIButton!
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("MainSearchVC시작 useridx = \(UserDefaults.standard.integer(forKey: "user_index"))")
    }
    override func viewDidDisappear(_ animated: Bool) {
         print("MainSearchVC시작 useridx = \(UserDefaults.standard.integer(forKey: "user_index"))")
    }
   
    func dismissKeyboard() {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func searchBtn(_ sender: UIButton) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)

    }

    @IBAction func searchTodoList(_ sender: Any) {
        self.performSegue(withIdentifier: "searchTodoList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        NSLog("세그가 실행됩니다")
        if segue.identifier == "searchTodoList"{
        let dest = segue.destination as! UINavigationController
        guard let tdlvc = dest.topViewController as? TodoListVC else{
            return
        }
        print("H")
        tdlvc.bulletList = self.bulletList
        print("H")
        tdlvc._searchingPlaceName = _place
        print("H")
            tdlvc._searchingPlaceCoordinate = _coordinate
        
        }
    }

 

}
extension MainSearchVC: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        _coordinate = place.coordinate
        _place = place.name
        
        
        apim.setApi(path: "/searchSubBull/\(_coordinate!.longitude)&\(_coordinate!.latitude)", method: .get, parameters: [:])
        apim.getTotoList{(builtIn) in
            print("셋팅")
            self.bulletList = builtIn
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
