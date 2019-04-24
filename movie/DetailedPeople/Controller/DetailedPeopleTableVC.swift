//
//  DetailedPeopleTableVC.swift
//  movie
//
//  Created by Daniel Parra on 4/23/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

class DetailedPeopleTableVC: BaseTableVC {
  
  let model = DetailedPeopleModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setNavigationTitleText(text: "\(model.person?.person?.name ?? "")")
    setUpTableViewHeader()
    tableView.reloadData()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    setUpTableViewHeader()
  }
  
  override func setUpTableVC() {
    super.setUpTableVC()
    tableView.register(DetailedSeriesCell.nib, forCellReuseIdentifier: DetailedSeriesCell.identifier)
  }
  
  private func setUpTableViewHeader() {
    guard let header = Bundle.main.loadNibNamed("DetailedPeopleHeader", owner: nil, options: nil)?.first as? DetailedPeopleHeader else {
      return
    }
    
    header.imageView.loadImageWithPlaceholder(url: model.person?.person?.image?.image ?? "", placeholder: Images.horizontalCover)
    tableView.tableHeaderView = header
    super.viewWillLayoutSubviews()
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.shows?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailedSeriesCell", for: indexPath) as? DetailedSeriesCell else {
      return UITableViewCell()
    }
    
    cell.textLabel?.text = model.shows?[indexPath.row].embedded?.show?.name ?? ""
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = DetailedSeriesTableVC()
    vc.model.serie = self.model.shows?[indexPath.row].embedded?.show
    self.navigationController?.pushViewController(vc, animated: true)
  }
}
