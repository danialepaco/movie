//
//  DetailedSeries.swift
//  movie
//
//  Created by Daniel Parra on 4/22/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation

class EpisodesModel {
  let service = ServiceLocator.sharedInstance.get(service: EpisodesServiceProtocol.self)
  var serie: Series?
  var seasons: [Seasons] = []
  var episodes: [Episodes] = [] {
    didSet {
      createSeasons()
    }
  }
  
  private func createSeasons() {
    var maxVal = 0
    for episode in episodes {
      if episode.season ?? 0 > maxVal {
        maxVal = episode.season ?? 0
        seasons.append(Seasons(season: episode.season ?? 0, episodes: []))
      }
    }
    
    for (index,season) in seasons.enumerated() {
      for episode in episodes {
        if season.season ?? 0 == episode.season ?? 0 {
          seasons[index].episodes?.append(episode)
        }
      }
    }
  }
  
  init() {}
}
