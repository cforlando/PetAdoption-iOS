//
//  LicensesViewController.swift
//  PetAdoption-iOS
//
//  Created by Amir Fleminger on 7/3/18.
//  Copyright © 2018 Code For Orlando. All rights reserved.
//

import UIKit

struct Item {
    let title: String
    let detail: String
    let url: String
}

class LicensesViewController: UITableViewController {
    
    var items = [Item]()
    let cellIdentifier = "Cell"
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        loadData()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
    }
    
    private func loadData(){
        items = [
            Item(title: "AlamoFire", detail: "Elegant HTTP Networking in Swift.", url: "https://github.com/Alamofire/Alamofire/blob/master/LICENSE"),
            Item(title: "CocoaPods", detail: "A dependency manager for Swift and Objective-C Cocoa projects.", url: "https://cocoapods.org/legal"),
            Item(title: "Code For Orlando - PetAdoption iOS", detail: "Our license.", url: "https://github.com/cforlando/PetAdoption-iOS/blob/develop/LICENSE.md"),
            Item(title: "Crashlitics", detail: "The most powerful, yet lightest weight crash reporting solution.", url: "https://www.fabric.io/licenses"),
            Item(title: "Fabric", detail: "Fabric is a platform that helps your mobile team build better apps, understand your users, and grow your business.", url: "https://fabric.io/licenses"),
            Item(title: "Petfinder API", detail: "The Petfinder API gives developers access to Petfinder's database of over 300,000 adoptable pets and 11,000 animal welfare organizations (AWO).", url: "https://www.petfinder.com/developers/api-docs"),
            Item(title: "SwiftyJSON", detail: "The better way to deal with JSON data in Swift.", url: "https://github.com/SwiftyJSON/SwiftyJSON/blob/master/LICENSE")
        ]
    }
    
    
    // MARK: - UITableVIewController
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellIdentifier)
        cell.accessoryType = .disclosureIndicator
        cell.tintColor = .gray
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = item.detail
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let url = item.url
        openWebpage(address: url, navigationController: self.navigationController, inAppBrowser: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
