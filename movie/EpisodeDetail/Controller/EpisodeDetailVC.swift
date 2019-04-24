//
//  EpisodeDetailVC.swift
//  movie
//
//  Created by Daniel Parra on 4/22/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

class EpisodeDetailVC: BaseVC {
  
  @IBOutlet weak var imageContainer: UIView!
  @IBOutlet weak var imageView: ShadowImageView!
  @IBOutlet weak var seasonLabel: UILabel!
  @IBOutlet weak var summaryLabel: UILabel!
  
  let model = EpisodeModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setNavigationTitleText(text: model.episode?.name ?? "")
    setUpView()
  }
  
  private func setUpView() {
    
    seasonLabel.text = "Season \(model.episode?.season ?? 0): Episode \(model.episode?.number ?? 0)"
    summaryLabel.text = model.episode?.summary?.stripOutHtml()
    
    guard let image = model.episode?.image?.image else {
      imageContainer.removeFromSuperview()
      return
    }
    imageView.loadImageWithPlaceholder(url: image, placeholder: Images.horizontalCover)
  }
}
