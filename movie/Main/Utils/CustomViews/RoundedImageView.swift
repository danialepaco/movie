//
//  RoundedImageView.swift
//  movie
//
//  Created by Daniel Parra on 4/23/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation

class RoundedImageView: ShadowImageView {
  
  override func awakeFromNib() {
    super.awakeFromNib()
    layer.cornerRadius = layer.frame.height/2
    clipsToBounds = true
  }
}
