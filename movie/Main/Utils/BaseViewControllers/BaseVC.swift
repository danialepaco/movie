//
//  BaseVC.swift
//  movie
//
//  Created by Daniel Parra on 4/22/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

class BaseVC: UIViewController, UIGestureRecognizerDelegate, BaseViewModel {
  
  var activityIndicator = UIActivityIndicatorView.init(style: .whiteLarge)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    settingActivityIndicator()
  }

  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }
  
  private func settingActivityIndicator() {
    view.addSubview(activityIndicator)
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    activityIndicator.hidesWhenStopped = true
    activityIndicator.isHidden = true
    activityIndicator.color = UIColor.gray
    activityIndicator.backgroundColor = UIColor.white
    activityIndicator.layer.cornerRadius = 8
  }
  
  func setNavigationTitleText(text: String) {
    navigationController?.navigationBar.titleTextAttributes = [
      NSAttributedString.Key.font: UIFont.MuliSemibold(size: 17),
      NSAttributedString.Key.foregroundColor: UIColor.white]
    navigationItem.title = text
  }
  
  func showLoader() {
    view.bringSubviewToFront(activityIndicator)
    view.isUserInteractionEnabled = false
    activityIndicator.startAnimating()
  }
  
  func hideLoader() {
    view.sendSubviewToBack(activityIndicator)
    activityIndicator.stopAnimating()
  }
  
  func popViewController() {
    navigationController?.popViewController(animated: false)
  }
  
  func showAlert(title: String, message: String) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
    }))
    present(alert, animated: true, completion: nil)
  }
}
