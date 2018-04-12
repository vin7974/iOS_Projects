//
//  WebServiceLayer_Swift4.swift
//  API_StructureSample
//
//  Created by vinod on 2/7/18.
//  Copyright © 2018 vinod. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class WebServiceLayer_Swift4 {
    
    var baseUrl = ""
    var headers: [String: String] = Dictionary<String, String>();

    static var shared_ServiceLayer: WebServiceLayer_Swift4? = nil
    
    class func shareServiceLayerr() -> WebServiceLayer_Swift4 {
        let lockQueue = DispatchQueue(label: "self")
        lockQueue.sync {
            if shared_ServiceLayer == nil {
                shared_ServiceLayer = WebServiceLayer_Swift4()
                let config = configuration()
                shared_ServiceLayer?.baseUrl = "http://\(config.IP_Adress)/\(config.AppName)"
            }
        }
        return shared_ServiceLayer!
    }
    func noNetWorkAlert() {
        let alertController = UIAlertController(title: "No Internet", message: "Please check your connection settings.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: NSLocalizedString("OK", comment: "Cancel action"), style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
        })
        alertController.addAction(cancelAction)
        var topVC: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController
        while ((topVC?.presentedViewController) != nil) {
            topVC = topVC?.presentedViewController
        }
        topVC?.present(alertController, animated: true) {() -> Void in }
    }
    
    //************* ALL API CALLS USE "API_Helper" FUNCTION ****************
    
    func API_Helper(param: Dictionary <String, String> ,endPoint: String,type:String, completion: @escaping (Bool,String) -> ()) {
        
        if Connectivity.isConnectedToInternet() {
            
            let url = "\(baseUrl)/\(endPoint)"
            self.headers["Content-Type"] = "application/json"
    
            switch type {
            case "post":
                do {
                    Alamofire.request(url, method: .post, parameters:param, encoding: JSONEncoding.default, headers: self.headers).responseString {
                    response in
                    switch response.result {
                    case .success:
                        completion(true,(response.result.value)!)
                        break
                    case .failure(let error):
                        print(error)
                        }
                    }
                }
            case "get":
                print("GET")
            default:
                print("no match")
            }
        }
        else
        {
            self.noNetWorkAlert()
        }

    }
    

}
