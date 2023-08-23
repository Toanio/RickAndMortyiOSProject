//
//  InfoTableViewCell.swift
//  RickAndMortyiOSProject
//
//  Created by c.toan on 22.08.2023.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    static let identifier = "InfoTableViewCell"
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.text = "Species: "
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type: "
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender: "
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let speciesTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let genderTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let typeTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(speciesLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(genderLabel)
        contentView.addSubview(typeTextLabel)
        contentView.addSubview(speciesTextLabel)
        contentView.addSubview(genderTextLabel)
        
        NSLayoutConstraint.activate([
            speciesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            speciesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            speciesTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            speciesTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            typeLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 16),
            typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            typeTextLabel.topAnchor.constraint(equalTo: speciesTextLabel.bottomAnchor, constant: 16),
            typeTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            genderLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 16),
            genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            genderTextLabel.topAnchor.constraint(equalTo: typeTextLabel.bottomAnchor, constant: 16),
            genderTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func congifure(with info: CharacterResult) {
        self.speciesTextLabel.text = info.species
        self.typeTextLabel.text = "None"
        self.genderTextLabel.text = info.gender
    }

}
