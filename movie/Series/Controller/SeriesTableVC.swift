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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    model.updateIsFavorite()
    tableView.reloadData()
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
      self.model.updateIsFavorite()
      self.tableView.reloadData()
      self.hideLoader()
    })
  }
  
  @objc func favoriteAction(sender: UITapGestureRecognizer) {
    
    guard let sender = sender.view as? UIImageView else {
      return
    }
    
    var serie = model.isFilter ? model.filteredSeries[sender.tag] : model.series[sender.tag]
    
    if serie.isFavorite {
      serie.isFavorite = false
      let _ = CoreDataManager.sharedManager.delete(id: Int32(serie.id ?? 0))
    } else {
      serie.isFavorite = true
      CoreDataManager.sharedManager.insertPerson(name: serie.name ?? "", id: Int32(serie.id ?? 0), image: serie.image?.image ?? "", isFavorite: serie.isFavorite)
    }
    
    model.updateIsFavorite()
    tableView.reloadData()
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
    cell.updateIfFavorite(isFavorite: serie.isFavorite)
    let tap = UITapGestureRecognizer(target: self, action: #selector(favoriteAction(sender:)))
    cell.favImage.tag = indexPath.row
    cell.favImage.addGestureRecognizer(tap)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let serie = model.isFilter ? model.filteredSeries[indexPath.row] : model.series[indexPath.row]
    let vc = DetailedSeriesTableVC()
    vc.model.serie = serie
    navigationController?.pushViewController(vc, animated: true)
  }
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.row + 1 == model.series.count {
      getData()
    }
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return view.frame.height * 0.6
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
