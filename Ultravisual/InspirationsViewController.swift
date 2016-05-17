//
//  InspirationsViewController.swift
//  Ultravisual
//
//  Created by Arshin Jain on 2/27/16.
//  Copyright © 2016 Tibbit. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class InspirationsViewController: UICollectionViewController {
  
  let inspirations = Inspiration.allInspirations()
  //var showsPlaybackControls: Bool
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let patternImage = UIImage(named: "Pattern") {
      view.backgroundColor = UIColor(patternImage: patternImage)
    }
    collectionView!.backgroundColor = UIColor.clearColor()
    collectionView!.decelerationRate = UIScrollViewDecelerationRateFast
    
    // Tab Bar
    self.tabBarController?.tabBar.alpha = 0.4
    self.tabBarController?.tabBar.backgroundColor = UIColor.blackColor()
    
  }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let layout = collectionViewLayout as! UltravisualLayout
        let offset = layout.dragOffset * CGFloat(indexPath.item)
        if collectionView.contentOffset.y != offset {
            collectionView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
        }

      

        // Play Video
        let player = AVPlayer(URL: NSURL(string: inspirations[indexPath.item].time)!)
        
        // Debug Info
        //print("-----------------------")
        //print("URL: \(inspirations[indexPath.item].time)")
        //print("Selected Item: \(inspirations[indexPath.item]) at #\(indexPath.item)")
        
        
        let playerController = AVPlayerViewController()
        
        playerController.player = player
      
        /*
        
        // Problem: lacks Done/Cancel button
        self.addChildViewController(playerController)
        self.view.addSubview(playerController.view)
        playerController.view.frame = self.view.frame
        
        player.play()
        player.allowsExternalPlayback = true
        playerController.showsPlaybackControls = true*/
      
        self.presentViewController(playerController, animated: true) {
            playerController.player?.play()
        }
      
        
        /* Transition to AVKit View Controller and play video
        
        //self.performSegueWithIdentifier("playVideo", sender: self)
        
        self.prepareForSegue(UIStoryboardSegue, sender: self) {
            
            let destination = segue.destinationViewController as! AVPlayerViewController
            let url = NSURL(string: inspirations[indexPath.item].URL)
            destination.player = AVPlayer(URL: url!)
            
        }

        */
        
    }


}

extension InspirationsViewController {
  
  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return inspirations.count
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("InspirationCell", forIndexPath: indexPath) as! InspirationCell
    cell.inspiration = inspirations[indexPath.item]
    return cell
  }

}