//
//  SeriesService.swift
//  movie
//
//  Created by Daniel Parra on 4/21/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation
import Alamofire

private enum EndPoints: String {
  case shows
}

protocol SeriesServiceProtocol: Service {
  
  func getShows(numberOfPage index: Int, completion: @escaping ([Series]?) -> Void)
}

final class SeriesService: SeriesServiceProtocol {
  func getShows(numberOfPage index: Int, completion: @escaping ([Series]?) -> Void) {
    
    NetworkManager.manager.request("\(baseURL)\(EndPoints.shows)?page=\(index)", method: .get).responseData { [weak self] response in
      
      switch response.result {
        
      case .success:
        guard let data = response.result.value else { return completion(nil) }
        guard let response = JsonData.getModel([Series].self, data: data) else { return completion(nil) }
        completion(response)
        break
        
      case .failure(let _):
        completion(nil)
        break
      }
    }
  }
}
