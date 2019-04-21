//
//  BaseViewController.swift
//  movie
//
//  Created by Daniel Parra on 4/21/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

protocol BaseViewModel: class {
  func showLoader()
  func hideLoader()
  func showAlert(title: String, message: String)
  func popViewController()
}

class BaseViewController: UITableViewController, UIGestureRecognizerDelegate, BaseViewModel {
  
  var activityIndicator = UIActivityIndicatorView.init(style: .whiteLarge)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    settingActivityIndicator()
    self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
  }
  
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }
  
  fileprivate func settingActivityIndicator() {
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
    self.navigationController?.navigationBar.titleTextAttributes = [
      NSAttributedString.Key.font: UIFont.MuliSemibold(size: 17),
      NSAttributedString.Key.foregroundColor: UIColor.white]
    self.navigationItem.title = text
  }
  
  @objc func backButtonClicked(sender: UIBarButtonItem) {
    _ = self.navigationController?.popViewController(animated: true)
  }
  
  @objc func backButtonClickedDismiss(sender: UIBarButtonItem) {
    self.dismiss(animated: false, completion: nil)
  }
  
  func showLoader() {
    self.view.bringSubviewToFront(activityIndicator)
    self.view.isUserInteractionEnabled = false
    activityIndicator.startAnimating()
  }
  
  func hideLoader() {
    self.view.sendSubviewToBack(activityIndicator)
    self.view.isUserInteractionEnabled = true
    activityIndicator.stopAnimating()
  }
  
  func popViewController() {
    self.navigationController?.popViewController(animated: true)
  }
  
  func showAlert(title: String, message: String) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
    }))
    self.present(alert, animated: true, completion: nil)
  }
}
