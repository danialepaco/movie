//
//  People.swift
//  movie
//
//  Created by Daniel Parra on 4/23/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation

struct People: Codable {
  struct Person: Codable {
    struct Image: Codable {
      let image: String?
      private enum CodingKeys: String, CodingKey {
        case image = "medium"
      }
    }
    
    let id: Int?
    let name: String?
    let image: Image?
    
    private enum CodingKeys: String, CodingKey {
      case id
      case name
      case image
    }
  }
  
  let person: Person?
  
  private enum CodingKeys: String, CodingKey {
    case person
  }
}
