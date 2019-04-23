//
//  SeriesModel.swift
//  movie
//
//  Created by Daniel Parra on 4/21/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation

struct Series: Codable {
  struct Image: Codable {
    let image: String?
    private enum CodingKeys: String, CodingKey {
      case image = "medium"
    }
  }
  
  struct Schedule: Codable {
    let time: String?
    let days: [String]?
    private enum CodingKeys: String, CodingKey {
      case time
      case days
    }
  }
  
  let id: Int?
  let name: String?
  let genres: [String]?
  let summary: String?
  let image: Image?
  let schedule: Schedule?
  var isFavorite = false
  
  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case genres
    case summary
    case image
    case schedule
  }  
}

struct SearchSeries: Codable {
  
  let show: Series?
  
  private enum CodingKeys: String, CodingKey {
    case show
  }
}
