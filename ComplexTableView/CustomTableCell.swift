//
//  CustomTableCell.swift
//  ComplexTableView
//
//  Created by 이건준 on 2022/02/22.
//

import UIKit

enum Status {
    case noData
}

class CustomTableCell: UITableViewCell {
    
    var status: Status = .noData {
        didSet {
            
        }
    }
    
    let customImageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        backgroundColor = .systemBackground
        
        addSubview(customImageView)
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        customImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        customImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        customImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: customImageView.rightAnchor).isActive = true
    }
}
