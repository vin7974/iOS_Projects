//
//  LoginModel.swift
//  API_StructureSample
//
//  Created by vinod on 2/14/18.
//  Copyright © 2018 vinod. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper

class loginResponse: Mappable  {
    var success: NSInteger?
    var token: String?
    var user_id: NSInteger?
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        token <- map["token"]
        user_id <- map["user_id"]
    }
    
}
