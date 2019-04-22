//
//  DetailedSeriesHeader.swift
//  movie
//
//  Created by Daniel Parra on 4/22/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

class DetailedSeriesHeader: UITableViewHeaderFooterView {

  @IBOutlet weak var mainView: UIView!
  @IBOutlet weak var imageView: ShadowImageView!
  @IBOutlet weak var genresLabel: UILabel!
  @IBOutlet weak var schedule: UILabel!
  @IBOutlet weak var summary: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
}
