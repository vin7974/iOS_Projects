//
//  ViewController.swift
//  API_StructureSample
//
//  Created by vinod on 2/7/18.
//  Copyright © 2018 vinod. All rights reserved.
//

import UIKit
import ObjectMapper

class ViewController: UIViewController {

    @IBOutlet weak var userNameTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userNameTxtFld.text = "test@gmail.com"
        passwordTxtFld.text = "confianz123#"
        

    }

    @IBAction func loginBtnAction(_ sender: Any) {
        
        WebServiceLayer_Swift4.shareServiceLayerr().API_Helper(param: ["username":userNameTxtFld.text!, "password": passwordTxtFld.text!], endPoint: "login", type: "post") { (success, data) in
            if success
            {
                let loginResponse = Mapper<loginResponse>().map(JSONString:data)
                print("******* TOKEN *******",loginResponse?.token as Any)
                
            }
            else
            {
                print("Error")
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

