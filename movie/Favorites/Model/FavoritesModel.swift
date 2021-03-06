//
//  FavoritesModel.swift
//  movie
//
//  Created by Daniel Parra on 4/22/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation

class FavoritesModel {
  let service = ServiceLocator.sharedInstance.get(service: SeriesServiceProtocol.self)
  var series: [Serie] = [] {
    didSet {
      series = series.sorted(by: { $0.name ?? "" < $1.name ?? "" })
    }
  }
  init() {}
}
