//
//  Movie.swift
//  NowShowing
//
//  Created by Denny Tsai on 7/18/16.
//  Copyright © 2016 hpd.io. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let nowPlayingMoviesURL = "https://hpd-iosdev.firebaseio.com/movies/nowPlaying.json"

class Movie {
    
    let JSONObject: JSON
    
    var title: String {
        get {
            return JSONObject["title"].stringValue
        }
    }
    
    var englishTitle: String? {
        get {
            return JSONObject["englishTitle"].string
        }
    }
    
    var URL: NSURL {
        get {
            return JSONObject["link"].URL!
        }
    }
    
    var posterImageURL: NSURL? {
        get {
            return JSONObject["posterImageUrl"].URL
        }
    }
    
    var openingDate: String? {
        get {
            return JSONObject["openingDate"].string
        }
    }
    
    var runtime: Int? {
        get {
            return JSONObject["runtime"].int
        }
    }
    
    var shortPlot: String? {
        get {
            return JSONObject["shortPlot"].string
        }
    }
    
    var fullPlot: String? {
        get {
            return JSONObject["fullPlot"].string
        }
    }
    
    var IMDbID: String? {
        get {
            return JSONObject["imdbId"].string
        }
    }
    
    var IMDbRating: Double? {
        get {
            return JSONObject["imdbRating"].double
        }
    }
    
    var IMDbRatingCount: Int? {
        get {
            return JSONObject["imdbRatingCount"].int
        }
    }
    
    var theaters: [Theater] {
        get {
            return JSONObject["theaters"].arrayValue.map { Theater(JSONObject: $0) }
        }
    }
    
    init(JSONObject: JSON) {
        self.JSONObject = JSONObject
    }
    
    class func moviesFromJSONObjects(JSONObjects: JSON) -> [Movie]? {
        if let JSONObjects = JSONObjects.array {
            return JSONObjects.map { Movie(JSONObject: $0) }
        } else {
            return nil
        }
    }
    
    class func downloadNowPlayingMovies(completionHandler: ([Movie]?, NSError?) -> Void) {
        Alamofire.request(.GET, nowPlayingMoviesURL)
            .responseJSON { response in
                switch response.result {
                    case .Success(let value):
                        let json = JSON(value)
                        let movies = Movie.moviesFromJSONObjects(json)
                        completionHandler(movies, nil)
                    
                    case .Failure(let error):
                        completionHandler(nil, error)
                }
            }
    }

}
