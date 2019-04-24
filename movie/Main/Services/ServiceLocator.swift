//
//  ServiceLocator.swift
//  movie
//
//  Created by Daniel Parra on 4/21/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation

protocol ServiceLocatorProtocol {
  
  func get<T>(service: T.Type) -> T?
}

final class ServiceLocator: ServiceLocatorProtocol {
  static let sharedInstance = ServiceLocator()
  
  func get<T>(service: T.Type) -> T? {
    
    switch String(describing: service) {
      
    case String(describing: SeriesServiceProtocol.self):
      return SeriesService() as? T
    case String(describing: EpisodesServiceProtocol.self):
      return EpisodesService() as? T
    case String(describing: PeopleServiceProtocol.self):
      return PeopleService() as? T
    default:
      return nil
    }
  }
}
