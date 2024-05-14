//
//  NewsCell.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import UIKit

class ArticleCell: UICollectionViewCell {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var imageOverlayView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.opacity = 0.8
        return view
    }()
    
    private lazy var sourceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var readButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.imagePlacement = .leading
        config.imagePadding = 8
        config.baseBackgroundColor = UIColor(hex: "212121")
        config.baseForegroundColor = UIColor.white
        config.cornerStyle = .capsule
        config.imagePlacement = .trailing
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            return outgoing
        }
        let image = UIImage(systemName: "arrow.right")
               config.image = image
               config.contentInsets = .init(top: 0, leading: 8, bottom: 0, trailing: 8)
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        button.setTitle("Read More", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        button.isUserInteractionEnabled = false
        return button
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        contentView.addSubview(image)
        image.addSubview(imageOverlayView)
        contentView.addSubview(sourceLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(readButton)
    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // Overlay
            imageOverlayView.topAnchor.constraint(equalTo: image.topAnchor),
            imageOverlayView.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            imageOverlayView.trailingAnchor.constraint(equalTo: image.trailingAnchor),
            imageOverlayView.bottomAnchor.constraint(equalTo: image.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            sourceLabel.topAnchor.constraint(equalTo: image.topAnchor, constant: 16),
            sourceLabel.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 16),
            sourceLabel.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: sourceLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            authorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            authorLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: readButton.leadingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            readButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            readButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14)
        ])
        
    }

    func configure(with article: Article) {
        titleLabel.text = article.title
        descriptionLabel.text = article.description
        authorLabel.text = article.author
        sourceLabel.text = article.source.name.uppercased()
        if let urlToImage = article.urlToImage,
           let url = URL(string: urlToImage) {
            image.downloaded(from: url)
            image.alpha = 1
        }
    }
}
