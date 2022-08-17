//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Konstantin Bolgar-Danchenko on 16.08.2022.
//

import UIKit

protocol HabitTapCallback {
    func onTap(position: Int)
}

class HabitCollectionViewCell: UICollectionViewCell {

    // MARK: - SETUP
    
    var habitTapCallback: (() -> Void)?
    
    private let baseInset: CGFloat = 20
    private let imageSize: CGFloat = 36
    
    var habit = Habit(name: "Выпить стакан воды перед завтраком", date: Date(), color: .systemRed)
    
    // MARK: - SUBVIEWS
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.applyHeadlineStyle()
        label.numberOfLines = 2
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.applyFootnoteStyle()
        label.textColor = .systemGray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var trackerLabel: UILabel = {
        let label = UILabel()
        label.applyCaptionStyle()
        label.text = "Счётчик: \(habit.trackDates.count)"
        label.applyFootnoteStyle()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var checkBoxButton: UIButton = {
        let button = UIButton()
        button.roundCornerWithRadius(18, top: true, bottom: true, shadowEnabled: false)
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(checkBoxButtonPressed), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var checkMarkImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.init(systemName: "checkmark"))
        imageView.tintColor = .white
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - LIFECYCLE
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setupView() {
        contentView.roundCornerWithRadius(6, top: true, bottom: true, shadowEnabled: false)
        contentView.backgroundColor = .white
    }
    
    private func setupSubview() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(trackerLabel)
        contentView.addSubview(checkBoxButton)
        contentView.addSubview(checkMarkImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: baseInset),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: baseInset),
            nameLabel.trailingAnchor.constraint(equalTo: checkBoxButton.leadingAnchor, constant: -baseInset),
            
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            trackerLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            trackerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -baseInset),
            
            checkBoxButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            checkBoxButton.heightAnchor.constraint(equalToConstant: imageSize),
            checkBoxButton.widthAnchor.constraint(equalToConstant: imageSize),
            checkBoxButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -47),
            
            checkMarkImageView.centerXAnchor.constraint(equalTo: checkBoxButton.centerXAnchor),
            checkMarkImageView.centerYAnchor.constraint(equalTo: checkBoxButton.centerYAnchor)
        ])
    }
    
    // MARK: - SET DATA
    
    func setData(habit: Habit) {
        self.habit = habit
        
        nameLabel.textColor = habit.color
        nameLabel.text = habit.name
        dateLabel.text = habit.dateString
        dateLabel.applyCaptionStyle()
        checkBoxButton.layer.borderColor = habit.color.cgColor
        trackerLabel.text = "Счётчик: \(habit.trackDates.count)"
        
        checkMarkImageView.isHidden = !habit.isAlreadyTakenToday
        
        if habit.isAlreadyTakenToday {
            checkBoxButton.backgroundColor = habit.color
        } else {
            checkBoxButton.backgroundColor = .white
        }
    }
    
    // MARK: - ACTIONS
    
    @objc func checkBoxButtonPressed() {
        if !habit.isAlreadyTakenToday {
            HabitsStore.shared.track(habit)
            checkBoxButton.backgroundColor = habit.color
        }
        habitTapCallback?()
        checkMarkImageView.isHidden = !habit.isAlreadyTakenToday
    }
}
