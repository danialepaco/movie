//
//  EpisodesService.swift
//  movie
//
//  Created by Daniel Parra on 4/22/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation
import Alamofire

private enum EndPoints: String {
  case shows
}

protocol EpisodesServiceProtocol: Service {
  
  func getEpisodes(showKey id: Int, completion: @escaping ([Episodes]?) -> Void)
}

final class EpisodesService: EpisodesServiceProtocol {
  
  func getEpisodes(showKey id: Int, completion: @escaping ([Episodes]?) -> Void) {
    
    NetworkManager.manager.request("\(baseURL)\(EndPoints.shows)/\(id)/episodes", method: .get).responseData { [weak self] response in
      
      switch response.result {
        
      case .success:
        guard let data = response.result.value else { return completion(nil) }
        guard let response = JsonData.getModel([Episodes].self, data: data) else { return completion(nil) }
        completion(response)
        break
        
      case .failure:
        completion(nil)
        break
      }
    }
  }
}
