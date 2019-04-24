//
//  PeopleModel.swift
//  movie
//
//  Created by Daniel Parra on 4/23/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation

class PeopleModel {
  let service = ServiceLocator.sharedInstance.get(service: PeopleServiceProtocol.self)
  var people: [People] = []  
  init() {}
}
