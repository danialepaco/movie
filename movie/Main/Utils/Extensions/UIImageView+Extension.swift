//
//  UIImageView+Extension.swift
//  movie
//
//  Created by Daniel Parra on 4/21/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
  
  func loadImage(url: String) {
    let url = URL(string: url)
    self.kf.setImage(with: url, placeholder: Images.cover, options: nil, progressBlock: nil) { (result) in
      
    }
  }
  
  func loadImageWithPlaceholder(url: String, placeholder: UIImage?) {
    let url = URL(string: url)
    self.kf.setImage(with: url, placeholder: placeholder, options: nil, progressBlock: nil) { (result) in
      
    }
  }
}
