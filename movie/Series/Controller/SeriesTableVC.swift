//
//  SeriesTableVC.swift
//  movie
//
//  Created by Daniel Parra on 4/21/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

class SeriesTableVC: BaseTableVC {
  
  @IBOutlet weak var searchBar: UISearchBar!
  let model = SeriesModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar.delegate = self
    setNavigationTitleText(text: "Series")
    getData()
  }
  
  override func setUpTableVC() {
    super.setUpTableVC()
    tableView.register(SeriesTableViewCell.nib, forCellReuseIdentifier: SeriesTableViewCell.identifier)
  }

  private func getData() {
    
    guard !model.isFilter else {
      return
    }
    showLoader()
    model.service?.getShows(numberOfPage: model.count, completion: { (response) in
      guard let response = response else {
        return
      }
      self.model.count += 1
      self.model.series += response
      self.tableView.reloadData()
      self.hideLoader()
    })
  }
  
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard !model.isFilter else {
      return model.filteredSeries.count
    }
    return model.series.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let serie = model.isFilter ? model.filteredSeries[indexPath.row] : model.series[indexPath.row]
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: SeriesTableViewCell.identifier, for: indexPath) as? SeriesTableViewCell else {
      return UITableViewCell()
    }
    
    cell.serieLabel.text = serie.name
    cell.mainImage.loadImage(url: serie.image?.image ?? "")
    return cell
  }
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.row + 1 == model.series.count {
      getData()
    }
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return view.frame.height/2
  }
}

extension SeriesTableVC: UISearchBarDelegate {
  
  func finishedFilter() {
    searchBar.text = ""
    model.isFilter = false
    model.filteredSeries.removeAll()
    view.endEditing(true)
    tableView.reloadData()
  }
  
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    finishedFilter()
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    finishedFilter()
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    guard searchText == "" else {
      return
    }
    finishedFilter()
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    showLoader()
    model.service?.searchShows(showToSearch: searchBar.text ?? "", completion: { (response) in
      guard let response = response else {
        return
      }
      self.model.isFilter = true
      self.model.filteredSeries = response.compactMap({ $0.show })
      self.tableView.reloadData()
      self.view.endEditing(true)
      self.hideLoader()
    })
  }
}
