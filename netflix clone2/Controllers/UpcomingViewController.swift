//
//  UpcomingViewController.swift
//  netflix clone2
//
//  Created by 김기현 on 2023/02/01.
//

import UIKit

class UpcomingViewController: UIViewController {

    private let upcomingTable: UITableView = {

        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .systemBackground
        title = "upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always


        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self

    }
}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
}
