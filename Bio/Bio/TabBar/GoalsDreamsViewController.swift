//
//  GoalsDreamsViewController.swift
//  Bio
//
//  Created by BMK on 13.02.2025.
//

import UIKit

class GoalsDreamsViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Goals and Dreams"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .yellow
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let goalsLabel: UILabel = createSectionLabel(text: "Goals")
    let dreamsLabel: UILabel = createSectionLabel(text: "Dreams")

    let goalsTextView: UITextView = {
        let textView = createTextView(text: """
        • Two-time silver medalist of the Republic of Kazakhstan in volleyball.
        • Graduated from school with honors.
        • Completed military service.
        • Completed courses in psychology and self-knowledge.
        • I realized that in life there is no black and white, justice and injustice. Shit always happens, the most important thing is how you react to it.
        • I realized that every action of mine has a consequence, and I learned to accept and steadfastly endure the consequences.
        """)
        return textView
    }()

    let dreamsTextView: UITextView = {
        let textView = createTextView(text: """
        • Graduate from the University.
        • Become a professional in your craft.
        • Become a sought-after developer in the IT field.
        • Enter the top 5 of the Forbes World list.
        • Learn to live now.
        • See the whole world with my own eyes.
        """)
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }

    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(goalsLabel)
        view.addSubview(goalsTextView)
        view.addSubview(dreamsLabel)
        view.addSubview(dreamsTextView)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            goalsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            goalsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            goalsTextView.topAnchor.constraint(equalTo: goalsLabel.bottomAnchor, constant: 10),
            goalsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            goalsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            goalsTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),

            dreamsLabel.topAnchor.constraint(equalTo: goalsTextView.bottomAnchor, constant: 20),
            dreamsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            dreamsTextView.topAnchor.constraint(equalTo: dreamsLabel.bottomAnchor, constant: 10),
            dreamsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dreamsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dreamsTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            dreamsTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    private static func createSectionLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    private static func createTextView(text: String) -> UITextView {
        let textView = UITextView()
        textView.text = text
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.textColor = .yellow
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }
}
