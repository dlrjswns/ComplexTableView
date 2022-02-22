//
//  RootViewController.swift
//  ComplexTableView
//
//  Created by 이건준 on 2022/02/22.
//

import UIKit

enum FeedItem {
    case photo(String)
    case book(String)
}

struct SectionModel {
    let feedItem: FeedItem
}

struct Section {
    let title: String
    let sectionModel: [SectionModel]
}

class RootViewController: UIViewController {
    
    let cellModel: [Section] = [
        Section(title: "Today", sectionModel: [
            SectionModel(feedItem: .photo("heart.fill")),
            SectionModel(feedItem: .book("과연 테이블뷰의 운명은...?")),
            SectionModel(feedItem: .photo("person.fill"))
        ]),
        Section(title: "Tomorrow", sectionModel: [
            SectionModel(feedItem: .book("제발 잘 성공했으면 좋겠어용"))
        ])

    ]
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableCell.self, forCellReuseIdentifier: "cell")
    }
}

extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModel[section].sectionModel.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellModel.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return cellModel[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableCell
        let feedItem = cellModel[indexPath.section].sectionModel[indexPath.row].feedItem
        switch feedItem {
        case .book(let title):
            cell.nameLabel.text = title
        case .photo(let imageName):
            cell.customImageView.image = UIImage(systemName: imageName)
        }
        return cell
    }
}
