//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Konstantin Bolgar-Danchenko on 16.08.2022.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
    // MARK: - SUBVIEWS
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Всё получится!"
        label.applyStyle(color: Styles.darkGrayColor, font: Styles.statusFootnoteFont)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var habitSlider: UISlider = {
        let slider = UISlider()
        slider.setThumbImage(UIImage(), for: .normal)
        slider.setValue(HabitsStore.shared.todayProgress, animated: true)
        slider.tintColor = Styles.purpleColor
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.applyStyle(color: Styles.darkGrayColor, font: Styles.footnoteFont)
        label.text = String(Int(HabitsStore.shared.todayProgress * 100)) + "%"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        contentView.roundCornerWithRadius(4, top: true, bottom: true, shadowEnabled: false)
        contentView.backgroundColor = .white
    }
    
    private func setupSubview() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(habitSlider)
        contentView.addSubview(statusLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            habitSlider.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            habitSlider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            habitSlider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            habitSlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            habitSlider.heightAnchor.constraint(equalToConstant: 7),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: habitSlider.trailingAnchor)
        ])
    }
    
    // MARK: - PUBLIC METHODS
    
    func show() {
        habitSlider.setValue(HabitsStore.shared.todayProgress, animated: true)
        statusLabel.text = String(Int(HabitsStore.shared.todayProgress * 100)) + "%"
    }
}
