//
//  LoginVC.swift
//  movie
//
//  Created by Daniel Parra on 4/22/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginVC: BaseVC {
  
  @IBAction func touchIdAction(_ sender: UIButton) {
    
    let myContext = LAContext()
    let myLocalizedReasonString = "Your favorite movies are protected 🔒"
    
    var authError: NSError?
    if #available(iOS 8.0, macOS 10.12.1, *) {
      if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
        myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { success, evaluateError in
          
          DispatchQueue.main.async {
            if success {
              Router.presentHomeViewController()
            } else {
              self.showAlert(title: "🔐", message: "Try again...")
            }
          }
        }
      } else {
        showAlert(title: "Sorry!!..", message: "Could not evaluate policy.")
      }
    } else {
      showAlert(title: "Ooops!!..", message: "This feature is not supported.")
    }
  }
}
