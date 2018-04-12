//
//  ConnectivityManager.swift
//  API_StructureSample
//
//  Created by vinod on 2/7/18.
//  Copyright © 2018 vinod. All rights reserved.
//

import Foundation
import Alamofire
class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
