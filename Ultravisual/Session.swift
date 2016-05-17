//
//  Session.swift
//  Ultravisual
//
//  Created by Arshin Jain on 2/27/16.
//  Copyright © 2016 Tibbit. All rights reserved.
//

import UIKit

class Session {
  
  //var URL:      String
  var title:    String
  var speaker:  String
  var room:     String
  var time:     String
  var backgroundImage: UIImage
  
  var roomAndTime: String {
    get {
      // return "\(time) • \(room)"
      return "\(room)"
    }
  }
  
  init( title: String, speaker: String, room: String, time: String, backgroundImage: UIImage) {
    //self.URL = URL
    self.title = title
    self.speaker = speaker
    self.room = room
    self.time = time
    self.backgroundImage = backgroundImage
  }
  
  convenience init(dictionary: NSDictionary) {
    //let URL             = dictionary["URL"] as? String
    let title           = dictionary["Title"] as? String
    let speaker         = dictionary["Speaker"] as? String
    let room            = dictionary["Room"] as? String
    let time            = dictionary["Time"] as? String
    let backgroundName  = dictionary["Background"] as? String
    let backgroundImage = UIImage(named: backgroundName!)
    self.init(title: title!, speaker: speaker!, room: room!, time: time!, backgroundImage: backgroundImage!.decompressedImage)
  }

}
