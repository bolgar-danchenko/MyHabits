//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Konstantin Bolgar-Danchenko on 10.08.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    // MARK: - SUBVIEWS
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .white
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let infoTextHeader = InfoData.makeTextLabel(text: InfoData.headerText, size: 20, weight: .bold)
    private let infoText0 = InfoData.makeTextLabel(text: InfoData.text0, size: 17, weight: .regular)
    private let infoText1 = InfoData.makeTextLabel(text: InfoData.text1, size: 17, weight: .regular)
    private let infoText2 = InfoData.makeTextLabel(text: InfoData.text2, size: 17, weight: .regular)
    private let infoText3 = InfoData.makeTextLabel(text: InfoData.text3, size: 17, weight: .regular)
    private let infoText4 = InfoData.makeTextLabel(text: InfoData.text4, size: 17, weight: .regular)
    private let infoText5 = InfoData.makeTextLabel(text: InfoData.text5, size: 17, weight: .regular)
    private let infoText6 = InfoData.makeTextLabel(text: InfoData.text6, size: 17, weight: .regular)
    private let sourceText = InfoData.makeTextLabel(text: InfoData.sourceText, size: 17, weight: .regular)
    
    private lazy var infoStackView: UIStackView = {
        let infoStackView = UIStackView()
        infoStackView.axis = .vertical
        infoStackView.alignment = .leading
        infoStackView.spacing = 12
        
        infoStackView.addArrangedSubview(self.infoText0)
        infoStackView.addArrangedSubview(self.infoText1)
        infoStackView.addArrangedSubview(self.infoText2)
        infoStackView.addArrangedSubview(self.infoText3)
        infoStackView.addArrangedSubview(self.infoText4)
        infoStackView.addArrangedSubview(self.infoText5)
        infoStackView.addArrangedSubview(self.infoText6)
        infoStackView.addArrangedSubview(self.sourceText)
        
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        return infoStackView
    }()
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupSubview()
        setupConstraints()
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        self.title = "Информация"
    }
    
    private func setupSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(infoTextHeader)
        contentView.addSubview(infoStackView)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            infoTextHeader.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            infoTextHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            infoTextHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            infoStackView.topAnchor.constraint(equalTo: infoTextHeader.bottomAnchor, constant: 16),
            infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            infoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            infoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}
