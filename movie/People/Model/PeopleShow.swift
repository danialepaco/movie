//
//  PeopleShow.swift
//  movie
//
//  Created by Daniel Parra on 4/23/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation

struct PersonShows: Codable {
  struct Embedded: Codable {
    
    let show: Series?
    
    private enum CodingKeys: String, CodingKey {
      case show
    }
  }

  let embedded: Embedded?
  
  private enum CodingKeys: String, CodingKey {
    case embedded = "_embedded"
  }
}
