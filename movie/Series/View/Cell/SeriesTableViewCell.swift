//
//  SeriesTableViewCell.swift
//  movie
//
//  Created by Daniel Parra on 4/21/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

class SeriesTableViewCell: UITableViewCell {
  
  @IBOutlet weak var mainImage: UIImageView!
  @IBOutlet weak var favoriteImage: UIImageView!
  @IBOutlet weak var serieLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
}
