//
//  ShadowImageView.swift
//  movie
//
//  Created by Daniel Parra on 4/22/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

class ShadowImageView: UIImageView {

  override func awakeFromNib() {
    super.awakeFromNib()
    layer.shadowColor = UIColor.darkGray.cgColor
    layer.shadowOffset = CGSize(width: -2, height: 2)
    layer.shadowOpacity = 1
    layer.shadowRadius = 1.0
    clipsToBounds = false
  }
}
