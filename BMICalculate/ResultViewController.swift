//
//  ResultViewController.swift
//  BMICalculate
//
//  Created by Maksim on 03.06.2024.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "result_background")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 35, weight: .bold)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var resultLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 80, weight: .bold)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 20, weight: .light)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    
    private var mainStackView = UIStackView()
    private let recalculateButton: UIButton = UIButton(isBackgroundWhite: true)
    
    // MARK: - Public Properties
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    // MARK: - Life Cycle 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setupConstrains()
        
        
    }
    
    // MARK: - Set Views
    
    private func setViews() {
        
        resultLabel.text = bmiValue
        descriptionLabel.text = advice
        view.backgroundColor = color
        
       
        mainStackView = UIStackView(
            axis: .vertical,
            distribution: .fillProportionally,
            subViews: [
               titleLabel,
               resultLabel,
               descriptionLabel
            ]
        )
        
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
        view.addSubview(recalculateButton)
        
        
        titleLabel.text = "YOUR RESULT"
        resultLabel.text = "19.5"
        descriptionLabel.text = "EAT SOME SNACKS!"
        
        recalculateButton.addTarget(self, action: #selector(recalculateButtonTapped), for: .touchUpInside)
    }
    
    @objc private func recalculateButtonTapped() {
        dismiss(animated: true)
    }
    
}


extension ResultViewController {
    private func setupConstrains() {
        NSLayoutConstraint.activate([
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        recalculateButton.heightAnchor.constraint(equalToConstant: 51),
        recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        recalculateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        recalculateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        
        ])
    }
}
