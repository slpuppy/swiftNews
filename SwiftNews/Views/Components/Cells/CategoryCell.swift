//
//  CategoryCell.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 14/05/24.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        contentView.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    func configureAppearance(selected: Bool) {
        if selected {
            contentView.backgroundColor = .white
            contentView.layer.cornerRadius = 8
            titleLabel.textColor = UIColor(hex: "2C2C2C")
        } else {
            contentView.backgroundColor = UIColor(hex: "2C2C2C")
            contentView.layer.cornerRadius = 8
            titleLabel.textColor = .white
        }
       
    }
}
