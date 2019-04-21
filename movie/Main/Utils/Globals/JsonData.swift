//
//  JsonData.swift
//  movie
//
//  Created by Daniel Parra on 4/21/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import Foundation

public class JsonData {  
  public static func getModel<T>(_: T.Type, data: Data) -> T? where T: Codable {
    
    do {
      let decoder = JSONDecoder()
      return try decoder.decode(T.self, from: data)
    } catch {
      return nil
    }
  }
}
