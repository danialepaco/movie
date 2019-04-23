//
//  FavoriteTableVC.swift
//  movie
//
//  Created by Daniel Parra on 4/22/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

class FavoriteTableVC: BaseTableVC {
  
  let model = FavoritesModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setNavigationTitleText(text: "Favorites")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    getData()
  }
  
  override func setUpTableVC() {
    super.setUpTableVC()
    tableView.register(SeriesTableViewCell.nib, forCellReuseIdentifier: SeriesTableViewCell.identifier)
  }
  
  private func getData() {
    model.series = CoreDataManager.sharedManager.fetchAllSeries() ?? []
    tableView.reloadData()
  }
  
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.series.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let serie = model.series[indexPath.row]
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: SeriesTableViewCell.identifier, for: indexPath) as? SeriesTableViewCell else {
      return UITableViewCell()
    }
    
    cell.serieLabel.text = serie.name
    cell.mainImage.loadImage(url: serie.image ?? "")
    cell.favImage.isHidden = true
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    showLoader()
    model.service?.getShow(idOfShow: Int(model.series[indexPath.row].id), completion: { (response) in
      guard let response = response else {
        return
      }
      self.hideLoader()
      let vc = DetailedSeriesTableVC()
      vc.model.serie = response
      self.navigationController?.pushViewController(vc, animated: true)
    })
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return view.frame.height * 0.6
  }
}
