//
//  ShowTimesViewController.swift
//  NowShowing
//
//  Created by Denny Tsai on 7/20/16.
//  Copyright © 2016 hpd.io. All rights reserved.
//

import UIKit

class ShowTimesViewController: UICollectionViewController {
    
    var theaters: [Theater]!
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return theaters.count
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return theaters[section].showTimes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TimeCell", forIndexPath: indexPath) as! TimeCell
        let time = theaters[indexPath.section].showTimes[indexPath.row]
        
        cell.timeLabel.text = time
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "TheaterHeader", forIndexPath: indexPath) as! TheaterHeader
            let theater = theaters[indexPath.section]
            
            headerView.theaterNameLabel.text = theater.name
            headerView.filmVersionLabel.text = theater.filmVersion
            
            return headerView
        }
        
        return (nil as UICollectionReusableView?)!
    }

}
