//
//  MoviesViewController.swift
//  NowShowing
//
//  Created by Denny Tsai on 7/18/16.
//  Copyright © 2016 hpd.io. All rights reserved.
//

import UIKit
import SDWebImage

class MoviesViewController: UITableViewController {
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barStyle = .Black
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = view.bounds.size.width * 9 / 16
        
        loadMovies()
    }
    
    func loadMovies() {
        beginRefreshing()
        
        Movie.downloadNowPlayingMovies { movies, error in
            dispatch_async(dispatch_get_main_queue()) {
                self.refreshControl?.endRefreshing()
            }
            
            if let movies = movies {
                self.movies = movies
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func beginRefreshing() {
        if let refreshControl = refreshControl {
            if tableView.contentOffset.y == 0 {
                tableView.contentOffset = CGPointMake(0, -refreshControl.frame.size.height)
                refreshControl.beginRefreshing()
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        
        cell.titleLabel.text = movie.title
        cell.englishTitleLabel.text = movie.englishTitle
        
        if let posterImageURL = movie.posterImageURL {
            cell.backgroundImageView.sd_setImageWithURL(posterImageURL)
        } else {
            cell.backgroundImageView.image = nil
        }
        
        if let rating = movie.IMDbRating {
            cell.IMDbRatingLabel.text = String(format: "%.1f", rating)
        } else {
            cell.IMDbRatingLabel.text = "--"
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMovieDetail" {
            let vc = segue.destinationViewController as! MovieDetailViewController
            let cell = sender as! MovieCell
            let indexPath = tableView.indexPathForCell(cell)!
            let movie = movies[indexPath.row]
            
            vc.movie = movie
        }
    }

    @IBAction func refreshPulled(sender: AnyObject) {
        loadMovies()
    }
}
