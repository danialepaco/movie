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
  case search = "search/shows?q="
}

protocol SeriesServiceProtocol: Service {
  
  func getShows(numberOfPage index: Int, completion: @escaping ([Series]?) -> Void)
  func searchShows(showToSearch showName: String, completion: @escaping ([SearchSeries]?) -> Void)
}

final class SeriesService: SeriesServiceProtocol {
  
  func searchShows(showToSearch showName: String, completion: @escaping ([SearchSeries]?) -> Void) {
    NetworkManager.manager.request("\(baseURL)\(EndPoints.search.rawValue)\(showName)", method: .get).responseData { [weak self] response in
      
      switch response.result {
        
      case .success:
        guard let data = response.result.value else { return completion(nil) }
        guard let response = JsonData.getModel([SearchSeries].self, data: data) else { return completion(nil) }
        completion(response)
        break
        
      case .failure:
        completion(nil)
        break
      }
    }
  }
  
  func getShows(numberOfPage index: Int, completion: @escaping ([Series]?) -> Void) {
    
    NetworkManager.manager.request("\(baseURL)\(EndPoints.shows)?page=\(index)", method: .get).responseData { [weak self] response in
      
      switch response.result {
        
      case .success:
        guard let data = response.result.value else { return completion(nil) }
        guard let response = JsonData.getModel([Series].self, data: data) else { return completion(nil) }
        completion(response)
        break
        
      case .failure:
        completion(nil)
        break
      }
    }
  }
}
