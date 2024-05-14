//
//  ArticleViewController.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import UIKit

class ArticleViewController: UIViewController {

    init(article: Article) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor(hex: "171717")
        self.setupSubviews()
        self.setupConstraints()
        self.setupContent(article: article)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
       return imageView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        let action = UIAction { _ in
            self.close()
        }
        button.addAction(action, for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
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
    
    private lazy var publishDateLabel: UILabel = {
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
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
}
    
    private func setupSubviews() {
        self.view.addSubview(imageView)
        self.view.addSubview(closeButton)
        self.view.addSubview(titleLabel)
        self.view.addSubview(publishDateLabel)
        self.view.addSubview(authorLabel)
        self.view.addSubview(publishDateLabel)
        self.view.addSubview(contentLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),      imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300)
            
        ])
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            closeButton.widthAnchor.constraint(equalToConstant: 36),
            closeButton.heightAnchor.constraint(equalToConstant: 36),
        ])
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            publishDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            publishDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupContent(article: Article) {
        if let urlToImage = article.urlToImage,
           let url = URL(string: urlToImage){
            imageView.downloaded(from: url)
        }
        
        self.titleLabel.text = article.title
        self.authorLabel.text = article.author
        self.contentLabel.text = article.content
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateStr = article.publishedAt
        if let date = formatter.date(from: dateStr) {
            formatter.dateFormat = "MMM dd, yyyy' - 'HH:mm"
            publishDateLabel.text = formatter.string(from: date)
        }
    }
    
    private func close(){
        self.dismiss(animated: true)
    }
    
}
