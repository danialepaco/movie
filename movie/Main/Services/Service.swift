//
//  Service.swift
//  movie
//
//  Created by Daniel Parra on 4/21/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation
import Alamofire

enum ApiError: Error {
  case parsingError
  case dataError
  case serverError
}

protocol Service {
  
  var baseURL: String { get }
  var header: HTTPHeaders { get }
}

extension Service {
  
  var baseURL: String {
    return "http://api.tvmaze.com/"
  }
  
  var header: HTTPHeaders { return
    ["Content-Type": "application/json"]
  }
}
