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

class BaseTableVC: UITableViewController, UIGestureRecognizerDelegate, BaseViewModel {
  
  var activityIndicator = UIActivityIndicatorView.init(style: .whiteLarge)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    settingActivityIndicator()
    setUpTableVC()
    navigationController?.interactivePopGestureRecognizer?.delegate = self
    navigationController?.interactivePopGestureRecognizer?.isEnabled = true
  }
  
  func setUpTableVC() {
    tableView.delegate = self
    tableView.dataSource = self
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
    view.isUserInteractionEnabled = true
    activityIndicator.stopAnimating()
  }
  
  func popViewController() {
    navigationController?.popViewController(animated: true)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    if let headerView = tableView.tableHeaderView {
      let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
      var headerFrame = headerView.frame
      
      if height != headerFrame.size.height {
        headerFrame.size.height = height
        headerView.frame = headerFrame
        tableView.tableHeaderView = headerView
      }
    }
  }
  
  func showAlert(title: String, message: String) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
    }))
    present(alert, animated: true, completion: nil)
  }
}
