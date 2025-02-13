//
//  ProfileViewController.swift
//  Bio
//
//  Created by BMK on 13.02.2025.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profile")) // Имя файла в Assets.xcassets
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let nameLabel = createLabel(text: "Full Name: Miras Begali")
    let birthDateLabel = createLabel(text: "Date of birth: 2002-10-21")
    let genderLabel = createLabel(text: "Sex: Male")
    let bioLabel = createLabel(text: "Biography: Born in Taldykorgan. At the age of 3, we moved to the urban-type settlement of Saryozek. In 2014, we moved back to Taldykorgan. Before graduation, he studied at No. 4. In 2019, he graduated with honors and entered the KBTU University. In 2021, he decided to pay his debt to his homeland and was called up for military service. He served in military unit 30212 (in the first 6 months), after which he was transferred to military unit 82796. In 2022, he was successfully demobilized. In the fall, after being reinstated in his studies, in December he had to take academic leave again due to health reasons. In January 2024, he was reinstated at the KBTU University, and at the moment I am a 3rd year student. P.S. Tried to drop out of university 7 times")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(birthDateLabel)
        view.addSubview(genderLabel)
        view.addSubview(bioLabel)

        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),

            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            birthDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            birthDateLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            birthDateLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

            genderLabel.topAnchor.constraint(equalTo: birthDateLabel.bottomAnchor, constant: 10),
            genderLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            genderLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

            bioLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            bioLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ])
    }

    private static func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .yellow // Устанавливаем жёлтый цвет текста
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

}

