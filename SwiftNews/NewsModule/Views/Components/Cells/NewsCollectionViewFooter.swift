//
//  NewsCollectionViewFooter.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 14/05/24.
//

import UIKit

protocol LoadMoreFooterViewDelegate: AnyObject {
    func didTapLoadMore()
}

class LoadMoreFooterView: UICollectionViewCell {
    
    weak var delegate: LoadMoreFooterViewDelegate?
    
    static let reuseIdentifier = "LoadMoreFooterView"
    
    private lazy var loadMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Load more", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 16
        button.layer.cornerCurve = .continuous
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(loadMoreButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(loadMoreButton)
        loadMoreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadMoreButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadMoreButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            loadMoreButton.heightAnchor.constraint(equalToConstant: 32),
            loadMoreButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func loadMoreButtonTapped() {
        guard let delegate else { return }
        delegate.didTapLoadMore()
    }
    
}
