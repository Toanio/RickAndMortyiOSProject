//
//  DetailCharachterViewController.swift
//  RickAndMortyiOSProject
//
//  Created by c.toan on 22.08.2023.
//

import UIKit

enum Headers: Int {
    case info = 0
    case origin = 1
    case episodes = 2
}

class DetailCharachterViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .green
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.identifier)
        tableView.register(EpisodesTableViewCell.self, forCellReuseIdentifier: EpisodesTableViewCell.identifier)
        tableView.register(OriginTableViewCell.self, forCellReuseIdentifier: OriginTableViewCell.identifier)
        tableView.backgroundColor = UIColor.blackBG
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var character: CharacterResult?
    var listOfEpisode = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackBG
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(statusLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 140),
            imageView.widthAnchor.constraint(equalToConstant: 148),
            
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func configure(with character: CharacterResult) {
        self.nameLabel.text = character.name
        self.statusLabel.text = character.status
        
        APIManager.shared.getImage(url: character.image ?? "") { data in
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
    }
}

extension DetailCharachterViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Info"
        case 1:
            return "Origin"
        case 2:
            return "Episodes"
        default :
            return " "
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return listOfEpisode.count
        default :
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier, for: indexPath) as? InfoTableViewCell else { return UITableViewCell() }
            cell.congifure(with: character!)
            cell.backgroundColor = UIColor.blackCard
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: OriginTableViewCell.identifier, for: indexPath)
            cell.backgroundColor = UIColor.blackCard
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: EpisodesTableViewCell.identifier, for: indexPath)
            cell.backgroundColor = UIColor.blackCard
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 124
        case 1:
            return 80
        case 2:
            return 86
        default :
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view:UIView, forSection: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
        }
    }
}

extension DetailCharachterViewController: sendDataCharacterProtocol {
    func sendData(with charachter: CharacterResult) {
        self.nameLabel.text = charachter.name
        self.statusLabel.text = charachter.status

        APIManager.shared.getImage(url: charachter.image ?? "") { data in
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }

        self.listOfEpisode = charachter.episode
        self.character = charachter
    }
}
