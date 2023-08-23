//
//  EpisodesTableViewCell.swift
//  RickAndMortyiOSProject
//
//  Created by c.toan on 22.08.2023.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {
    
    static let identifier = "EpisodesTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
