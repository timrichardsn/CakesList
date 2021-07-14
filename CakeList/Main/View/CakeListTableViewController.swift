//
//  CakeListTableViewController.swift
//  CakeList
//
//  Created by Tim Richardson on 23/05/2019.
//  Copyright © 2019 Tim Richardson. All rights reserved.
//

import UIKit

class CakeListTableViewController: UITableViewController, CakeListViewProtocol {
    
    static let storyboardIdentifier: StoryboardIdentifier = .main
    var presenter: CakeListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "🎂 CakeItApp 🍰"
        
        presenter?.viewDidLoad()
    }
    
    func reloadData() {
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.model?.cakes.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelect(row: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cakeCell", for: indexPath) as! CakeListTableViewCell
        if let cake = presenter?.cake(at: indexPath.row) {
            cell.configure(cake)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
