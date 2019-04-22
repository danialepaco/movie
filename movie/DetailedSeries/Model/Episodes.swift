//
//  Episodes.swift
//  movie
//
//  Created by Daniel Parra on 4/22/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation

struct Episodes: Codable {
  struct Image: Codable {
    let image: String?
    private enum CodingKeys: String, CodingKey {
      case image = "medium"
    }
  }
  
  let season: Int?
  let number: Int?
  let name: String?
  let summary: String?
  let image: Image?

  private enum CodingKeys: String, CodingKey {
    case season
    case number
    case name
    case summary
    case image
  }
}

struct Seasons {
  let season: Int?
  var episodes: [Episodes]?
}
