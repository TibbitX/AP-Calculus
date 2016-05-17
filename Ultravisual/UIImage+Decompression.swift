//
//  UIImage+Decompression.swift
//  Ultravisual
//
//  Created by Arshin Jain on 2/27/16.
//  Copyright © 2016 Tibbit. All rights reserved.
//

import UIKit

extension UIImage {
  
  var decompressedImage: UIImage {
    UIGraphicsBeginImageContextWithOptions(size, true, 0)
    drawAtPoint(CGPointZero)
    let decompressedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return decompressedImage
  }
  
}
