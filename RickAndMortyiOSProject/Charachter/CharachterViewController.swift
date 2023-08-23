//
//  ViewController.swift
//  RickAndMortyiOSProject
//
//  Created by c.toan on 21.08.2023.
//

import UIKit

protocol sendDataCharacterProtocol {
    func sendData(with charachter: CharacterResult)
}

class CharachterViewController: UIViewController {
    
    var charachters = [CharacterResult]()
    var delegate: sendDataCharacterProtocol?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.collectionView?.layer.masksToBounds = true
        layout.collectionView?.layer.cornerRadius = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.blackBG
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackBG
        navigationItem.title = "Character"
        
        configureUI()
        
        APIManager.shared.getCharacter { result in
            self.charachters = result.results
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    private func configureUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension CharachterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charachters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CharacterCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = .gray
        let user = charachters[indexPath.row]
        cell.configure(with: user)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 202)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = charachters[indexPath.row]
        let vc = DetailCharachterViewController()
        vc.sendData(with: character)
        navigationController?.pushViewController(vc, animated: true)
    }
}

