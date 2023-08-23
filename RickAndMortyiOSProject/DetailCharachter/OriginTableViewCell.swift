//
//  OriginTableViewCell.swift
//  RickAndMortyiOSProject
//
//  Created by c.toan on 22.08.2023.
//

import UIKit

class OriginTableViewCell: UITableViewCell {

    static let identifier = "OriginTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
