//
//  UICollectionViewCell+Extension.swift
//  movie
//
//  Created by Daniel Parra on 4/23/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
  
  static var identifier: String {
    let name = String(describing: self)
    return name
  }
  
  static var nib: UINib {
    let nib = UINib(nibName: self.identifier, bundle: Bundle(for: self))
    return nib
  }
}
