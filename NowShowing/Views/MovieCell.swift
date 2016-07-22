//
//  MovieCell.swift
//  NowShowing
//
//  Created by Denny Tsai on 7/18/16.
//  Copyright © 2016 hpd.io. All rights reserved.
//

import UIKit
import GradientView

class MovieCell: UITableViewCell {

    @IBOutlet weak var infoContainerView: GradientView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var englishTitleLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var IMDbRatingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        infoContainerView.backgroundColor = UIColor.clearColor()
        infoContainerView.colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 0),
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.8),
            UIColor(red: 0, green: 0, blue: 0, alpha: 1),
        ]
        infoContainerView.locations = [0, 0.7, 1]
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
