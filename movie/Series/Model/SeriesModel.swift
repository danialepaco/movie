//
//  Series.swift
//  movie
//
//  Created by Daniel Parra on 4/21/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation

class SeriesModel {
  let service = ServiceLocator.sharedInstance.get(service: SeriesServiceProtocol.self)
  var series: [Series] = []
  var filteredSeries: [Series] = []
  var isFilter = false
  var count = 0
  
  init() {}
}
