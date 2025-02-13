//
//  InterestsHobbiesViewController.swift
//  Bio
//
//  Created by BMK on 13.02.2025.
//

import UIKit

struct Hobby {
    let imageName: String
    let title: String
    let description: String
}

class InterestsHobbiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let hobbies: [Hobby] = [
        Hobby(imageName: "coding", title: "Coding", description: "I love creating apps and solving problems with code."),
        Hobby(imageName: "volleyball", title: "Volleyball", description: "Played at a competitive level and won multiple medals."),
        Hobby(imageName: "travel", title: "Traveling", description: "Exploring new cultures and places around the world."),
        Hobby(imageName: "reading", title: "Reading", description: "I enjoy books on self-improvement, psychology, and technology."),
        Hobby(imageName: "gaming", title: "Gaming", description: "Playing video games to relax and improve strategic thinking."),
        Hobby(imageName: "walking_music", title: "Walking with Music", description: "I love taking walks while listening to my favorite music.")
    ]
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Interests and Hobbies"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .yellow
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .black
        table.tableFooterView = UIView() // Убирает белую пустоту снизу
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HobbyCell.self, forCellReuseIdentifier: "HobbyCell")
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hobbies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HobbyCell", for: indexPath) as! HobbyCell
        let hobby = hobbies[indexPath.row]
        cell.configure(with: hobby)
        return cell
    }
}

// MARK: - Custom UITableViewCell

class HobbyCell: UITableViewCell {
    
    let hobbyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellUI() {
        contentView.addSubview(hobbyImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            hobbyImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            hobbyImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            hobbyImageView.widthAnchor.constraint(equalToConstant: 80),
            hobbyImageView.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.leadingAnchor.constraint(equalTo: hobbyImageView.trailingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: hobbyImageView.trailingAnchor, constant: 15),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with hobby: Hobby) {
        hobbyImageView.image = UIImage(named: hobby.imageName)
        titleLabel.text = hobby.title
        descriptionLabel.text = hobby.description
    }
}
