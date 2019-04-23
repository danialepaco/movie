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
  
  func updateIsFavorite() {
    
    let fetchedSeries = CoreDataManager.sharedManager.fetchAllSeries() ?? []
    
    guard !fetchedSeries.isEmpty else {
      removeFavorites()
      return
    }
    
    for fetchedserie in fetchedSeries {
      for (index,serie) in series.enumerated() {
        if serie.id == Int(fetchedserie.id) {
          series[index].isFavorite = true
        } else {
          series[index].isFavorite = false
        }
      }
    }
  }
  
  func removeFavorites() {
    for (index,_) in series.enumerated() {
      series[index].isFavorite = false
    }
  }
}
