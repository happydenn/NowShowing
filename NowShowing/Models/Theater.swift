//
//  Theater.swift
//  NowShowing
//
//  Created by Denny Tsai on 7/18/16.
//  Copyright © 2016 hpd.io. All rights reserved.
//

import Foundation
import SwiftyJSON

class Theater {
    
    let JSONObject: JSON
    
    var name: String {
        get {
            return JSONObject["theaterName"].stringValue
        }
    }
    
    var filmVersion: String? {
        get {
            return JSONObject["filmVersion"].string
        }
    }
    
    var showTimes: [String] {
        get {
            return JSONObject["showTimes"].arrayValue.map { $0.stringValue }
        }
    }
    
    init(JSONObject: JSON) {
        self.JSONObject = JSONObject
    }

}
