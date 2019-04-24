//
//  PeopleService.swift
//  movie
//
//  Created by Daniel Parra on 4/23/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation
import Alamofire

private enum EndPoints: String {
  case search = "search/people?q="
  case shows = "castcredits?embed=show"
}

protocol PeopleServiceProtocol: Service {
  func searchPeople(personToSearch personName: String, completion: @escaping ([People]?) -> Void)
  func getPeopleShows(personId person: Int, completion: @escaping ([PersonShows]?) -> Void)
}

final class PeopleService: PeopleServiceProtocol {
  
  func searchPeople(personToSearch personName: String, completion: @escaping ([People]?) -> Void) {
    
    let url = "\(baseURL)\(EndPoints.search.rawValue)\(personName)"
    
    guard let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
      return
    }
    
    NetworkManager.manager.request(encodedURL, method: .get).responseData { [weak self] response in
      
      switch response.result {
        
      case .success:
        guard let data = response.result.value else { return completion(nil) }
        guard let response = JsonData.getModel([People].self, data: data) else { return completion(nil) }
        completion(response)
        break
        
      case .failure:
        completion(nil)
        break
      }
    }
  }
  
  func getPeopleShows(personId person: Int, completion: @escaping ([PersonShows]?) -> Void) {
    NetworkManager.manager.request("\(baseURL)people/\(person)/\(EndPoints.shows.rawValue)", method: .get).responseData { [weak self] response in
      
      switch response.result {
        
      case .success:
        guard let data = response.result.value else { return completion(nil) }
        guard let response = JsonData.getModel([PersonShows].self, data: data) else { return completion(nil) }
        completion(response)
        break
        
      case .failure:
        completion(nil)
        break
      }
    }
  }
}
