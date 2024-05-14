//
//  NewsCollectionViewHeader.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import UIKit

protocol NewsCollectionViewHeaderDelegate: AnyObject {
    func didTapCategory(category: NewsCategory)
}

class NewsCollectionViewHeader: UIView {
    
    weak var delegate: NewsCollectionViewHeaderDelegate?
    
    private var categories: [NewsCategory]?
    
    private var selectedCategory: NewsCategory?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(hex: "171717")
        self.setupSubviews()
        self.setupConstraints()
        self.setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.numberOfLines = 1
        label.text = "Fresh News"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
               layout.scrollDirection = .horizontal
               let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
               collectionView.backgroundColor = .clear
               collectionView.showsHorizontalScrollIndicator = false
               collectionView.translatesAutoresizingMaskIntoConstraints = false
               return collectionView
    }()
    
    
    private func setupSubviews() {
           self.addSubview(title)
           self.addSubview(categoriesCollectionView)
       }
       
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            categoriesCollectionView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 50),
            
            self.bottomAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 8)
        ])
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        categoriesCollectionView.setCollectionViewLayout(layout, animated: false)
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
    }
    
    func setupCategories(categories: [NewsCategory]) {
        self.categories = categories
        self.categoriesCollectionView.reloadData()
    }
    
    func updateeSelectedCategory(selectedCategory: NewsCategory) {
        self.selectedCategory = selectedCategory
        self.categoriesCollectionView.reloadData()
    }

} 

extension NewsCollectionViewHeader: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.titleLabel.text = categories?[indexPath.item].rawValue.capitalized
        if categories?[indexPath.item] == selectedCategory {
            cell.configureAppearance(selected: true)
        } else {
            cell.configureAppearance(selected: false)
        }
         return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let category = categories?[indexPath.item] {
            self.delegate?.didTapCategory(category: category)
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let categories = categories, indexPath.item < categories.count else {
            return CGSize(width: 100, height: 36)
        }

        let category = categories[indexPath.item].rawValue.capitalized
        let width = category.size(withAttributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)
        ]).width + 24

        return CGSize(width: width, height: 36)
    }
}

