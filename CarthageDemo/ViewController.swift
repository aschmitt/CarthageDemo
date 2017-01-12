//
//  ViewController.swift
//  CarthageDemo
//
//  Created by Andreas Schmitt on 11.01.17.
//  Copyright © 2017 Andreas Schmitt. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var myText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getData() {
        let url = "https://secure.apps.scout24.com/ff5a68b355fd70a45ec6/mobilehub/as24/searchparameter/1.4/de-de/json/type=C"
        Alamofire.request(url).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                self.myText.text = "\(JSON)"
            }
        }
    }
}

