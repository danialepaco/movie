//
//  DetailedSeriesTableVC.swift
//  movie
//
//  Created by Daniel Parra on 4/22/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

class DetailedSeriesTableVC: BaseTableVC {
  
  let model = EpisodesModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setNavigationTitleText(text: "\(model.serie?.name ?? "")")
    getData()
    setUpTableViewHeader()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    setUpTableViewHeader()
  }
  
  override func setUpTableVC() {
    super.setUpTableVC()
    tableView.register(DetailedSeriesCell.nib, forCellReuseIdentifier: DetailedSeriesCell.identifier)
  }
  
  private func setUpTableViewHeader() {
    guard let header = Bundle.main.loadNibNamed("DetailedSeriesHeader", owner: nil, options: nil)?.first as? DetailedSeriesHeader else {
      return
    }
    
    header.imageView.loadImage(url: model.serie?.image?.image ?? "")
    header.genresLabel.text = "\(model.serie?.genres?.joined(separator: ", ") ?? "")"
    header.schedule.text = "\(model.serie?.schedule?.days?.joined(separator: ", ") ?? "") at \(model.serie?.schedule?.time ?? "")"
    header.summary.text = model.serie?.summary?.stripOutHtml() ?? ""
    tableView.tableHeaderView = header
    super.viewWillLayoutSubviews()
  }
  
  private func getData() {
    showLoader()
    model.service?.getEpisodes(showKey: model.serie?.id ?? 0, completion: { (response) in
      guard let response = response else {
        return
      }
      self.model.episodes = response
      self.tableView.reloadData()
      self.hideLoader()
    })
  }
  
  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    return model.seasons.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.seasons[section].episodes?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Season \(model.seasons[section].season ?? 0)"
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailedSeriesCell", for: indexPath) as? DetailedSeriesCell else {
      return UITableViewCell()
    }
    
    let episode = model.seasons[indexPath.section].episodes?[indexPath.row]
    
    cell.textLabel?.text = "Episode \(episode?.number ?? 0): \(episode?.name ?? "")"
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = EpisodeDetailVC()
    vc.model.episode = model.seasons[indexPath.section].episodes?[indexPath.row]
    vc.model.serie = model.serie
    navigationController?.pushViewController(vc, animated: true)
  }
}
