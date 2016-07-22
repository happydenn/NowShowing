//
//  MovieDetailViewController.swift
//  NowShowing
//
//  Created by Denny Tsai on 7/19/16.
//  Copyright © 2016 hpd.io. All rights reserved.
//

import UIKit
import GradientView
import SDWebImage

class MovieDetailViewController: UIViewController {
    
    var movie: Movie!
    var fullPlotAttributes: [String: AnyObject]!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var englishTitleLabel: UILabel!
    @IBOutlet weak var fullPlotLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var openingDateLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var posterOverlayView: GradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullPlotAttributes = fullPlotLabel.attributedText?.attributesAtIndex(0, effectiveRange: nil)
        
        posterOverlayView.backgroundColor = UIColor(red: 25 / 255, green: 25 / 255, blue: 25 / 255, alpha: 0)
        posterOverlayView.colors = [
            UIColor(red: 25 / 255, green: 25 / 255, blue: 25 / 255, alpha: 0),
            UIColor(red: 25 / 255, green: 25 / 255, blue: 25 / 255, alpha: 1),
        ]
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        titleLabel.text = movie.title
        englishTitleLabel.text = movie.englishTitle
        
        if let rating = movie.IMDbRating {
            let ratingText = String(format: "%.1f", rating)
            ratingLabel.text = ratingText
        } else {
            ratingLabel.text = "-"
        }
        
        openingDateLabel.text = movie.openingDate
        
        if let posterImageURL = movie.posterImageURL {
            posterImageView.sd_setImageWithURL(posterImageURL)
        }
        
        if let runtime = movie.runtime {
            runtimeLabel.text = "\(runtime) 分鐘"
        } else {
            runtimeLabel.text = "-"
        }
        
        if let movie = movie, fullPlot = movie.fullPlot {
            let fullPlotText = NSAttributedString(string: fullPlot, attributes: fullPlotAttributes)
            fullPlotLabel.attributedText = fullPlotText
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTimes" {
            let vc = segue.destinationViewController as! ShowTimesViewController
            vc.theaters = movie.theaters
        }
    }
    
}
