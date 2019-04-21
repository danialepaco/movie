//
//  NetworkManager.swift
//  movie
//
//  Created by Daniel Parra on 4/21/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager {
  
  static var manager: Alamofire.SessionManager = {
    
    let serverTrustPolicyManager = CustomServerTrustPoliceManager()
    
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
    
    return Alamofire.SessionManager(
      configuration: configuration,
      serverTrustPolicyManager:serverTrustPolicyManager
    )
  }()
}

class CustomServerTrustPoliceManager : ServerTrustPolicyManager {
  override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
    return .disableEvaluation
  }
  
  public init() {
    super.init(policies: [:])
  }
}
