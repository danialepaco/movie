//
//  PeopleTableVC.swift
//  movie
//
//  Created by Daniel Parra on 4/23/19.
//  Copyright © 2019 danialepaco. All rights reserved.
//

import UIKit

class PeopleTableVC: BaseTableVC {
  
  @IBOutlet weak var searchBar: UISearchBar!
  
  let model = PeopleModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar.delegate = self
    setNavigationTitleText(text: "People")
  }
  
  override func setUpTableVC() {
    super.setUpTableVC()
    tableView.register(PeopleCell.nib, forCellReuseIdentifier: PeopleCell.identifier)
  }
  
  private func getData(name: String) {
    
    showLoader()
    model.people.removeAll()
    model.service?.searchPeople(personToSearch: name, completion: { (response) in
      guard let response = response else {
        return
      }
      self.model.people += response
      self.tableView.reloadData()
      self.hideLoader()
    })
  }
  
  private func getShowData(id: Int,completion: @escaping ([PersonShows]) -> Void) {
    
    showLoader()
    model.service?.getPeopleShows(personId: id, completion: { (response) in
      guard let response = response else {
        return
      }
      self.hideLoader()
      completion(response)
    })
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: PeopleCell.identifier, for: indexPath) as? PeopleCell else {
      return UITableViewCell()
    }
    
    cell.nameLabel.text = model.people[indexPath.row].person?.name
    cell.personImage.loadImageWithPlaceholder(url: model.people[indexPath.row].person?.image?.image ?? "", placeholder: Images.horizontalCover)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60.0
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    getShowData(id: model.people[indexPath.row].person?.id ?? 0) { (response) in
      
      guard !response.isEmpty else {
        return
      }
      
      let vc = DetailedPeopleTableVC()
      vc.model.person = self.model.people[indexPath.row]
      vc.model.shows = response
      self.navigationController?.pushViewController(vc, animated: true)
    }
  }
  
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.people.count
  }
}

extension PeopleTableVC: UISearchBarDelegate {
  
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    view.endEditing(true)
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.text = ""
    view.endEditing(true)
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    guard searchText == "" else {
      return
    }
    view.endEditing(true)
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    getData(name: searchBar.text ?? "")
  }
}
