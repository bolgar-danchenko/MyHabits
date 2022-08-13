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
    
    private lazy var infoTextHeader: UILabel = {
        let textHeader = UILabel()
        textHeader.text = "Привычка за 21 день"
        textHeader.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textHeader.textColor = UIColor.black
        
        textHeader.translatesAutoresizingMaskIntoConstraints = false
        return textHeader
    }()
    
    private lazy var infoText0: UILabel = {
        let infoText0 = UILabel()
        infoText0.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:"
        infoText0.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText0.textColor = UIColor.black
        infoText0.lineBreakMode = .byWordWrapping
        infoText0.numberOfLines = 0
        
        infoText0.translatesAutoresizingMaskIntoConstraints = false
        return infoText0
    }()
    
    private lazy var infoText1: UILabel = {
        let infoText1 = UILabel()
        infoText1.text = "1. Провести 1 день без обращенияк старым привычкам, стараться вести себя так, как будто цель, загаданнаяв перспективу, находится на расстоянии шага."
        infoText1.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText1.textColor = UIColor.black
        infoText1.lineBreakMode = .byWordWrapping
        infoText1.numberOfLines = 0
        
        infoText1.translatesAutoresizingMaskIntoConstraints = false
        return infoText1
    }()
    
    private lazy var infoText2: UILabel = {
        let infoText2 = UILabel()
        infoText2.text = "2. Выдержать 2 дня в прежнем состоянии самоконтроля."
        infoText2.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText2.textColor = UIColor.black
        infoText2.lineBreakMode = .byWordWrapping
        infoText2.numberOfLines = 0
        
        infoText2.translatesAutoresizingMaskIntoConstraints = false
        return infoText2
    }()
    
    private lazy var infoText3: UILabel = {
        let infoText3 = UILabel()
        infoText3.text = "3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче,с чем еще предстоит серьезно бороться."
        infoText3.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText3.textColor = UIColor.black
        infoText3.lineBreakMode = .byWordWrapping
        infoText3.numberOfLines = 0
        
        infoText3.translatesAutoresizingMaskIntoConstraints = false
        return infoText3
    }()
    
    private lazy var infoText4: UILabel = {
        let infoText4 = UILabel()
        infoText4.text = "4. Поздравить себя с прохождением первого серьезного порога в 21 день.За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств."
        infoText4.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText4.textColor = UIColor.black
        infoText4.lineBreakMode = .byWordWrapping
        infoText4.numberOfLines = 0
        
        infoText4.translatesAutoresizingMaskIntoConstraints = false
        return infoText4
    }()
    
    private lazy var infoText5: UILabel = {
        let infoText5 = UILabel()
        infoText5.text = "5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой."
        infoText5.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText5.textColor = UIColor.black
        infoText5.lineBreakMode = .byWordWrapping
        infoText5.numberOfLines = 0
        
        infoText5.translatesAutoresizingMaskIntoConstraints = false
        return infoText5
    }()
    
    private lazy var infoText6: UILabel = {
        let infoText6 = UILabel()
        infoText6.text = "6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся."
        infoText6.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoText6.textColor = UIColor.black
        infoText6.lineBreakMode = .byWordWrapping
        infoText6.numberOfLines = 0
        
        infoText6.translatesAutoresizingMaskIntoConstraints = false
        return infoText6
    }()
    
    private lazy var infoStackView: UIStackView = {
        let infoStackView = UIStackView()
        infoStackView.axis = .vertical
        infoStackView.alignment = .leading
        infoStackView.spacing = 12
//        infoStackView.distribution = .fillProportionally
        
        infoStackView.addArrangedSubview(self.infoText0)
        infoStackView.addArrangedSubview(self.infoText1)
        infoStackView.addArrangedSubview(self.infoText2)
        infoStackView.addArrangedSubview(self.infoText3)
        infoStackView.addArrangedSubview(self.infoText4)
        infoStackView.addArrangedSubview(self.infoText5)
        infoStackView.addArrangedSubview(self.infoText6)
        
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
            infoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            infoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
        contentView.subviews.last?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
