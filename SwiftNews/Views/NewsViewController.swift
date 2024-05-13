//
//  HomeViewController.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import UIKit

import UIKit

class NewsViewController: UIViewController {
    
    private var viewModel: NewsViewModelProtocol
    
    init(viewModel: NewsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var collectionView: UICollectionView = {
           let layout = createCompositionalLayout()
           let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
           collectionView.delegate = self
           collectionView.dataSource = self
           collectionView.register(ArticleCell.self, forCellWithReuseIdentifier: "ArticleNewsCell")
           collectionView.backgroundColor = .white
           collectionView.translatesAutoresizingMaskIntoConstraints = false
           collectionView.backgroundColor = UIColor(hex: "171717")
           return collectionView
       }()
    
    private var newsList: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        self.fetchNews()
    }

    private func setupSubviews() {
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
           let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                 heightDimension: .absolute(200))
           let item = NSCollectionLayoutItem(layoutSize: itemSize)
           let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .absolute(200))
           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
           let section = NSCollectionLayoutSection(group: group)
           section.interGroupSpacing = 10
           section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
           let layout = UICollectionViewCompositionalLayout(section: section)
           return layout
       }
    
    private func fetchNews(){
        viewModel.getNewsForLocation() { [weak self] result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case .failure(_):
                print("Failed to fetch")
            }
        }
    }
    
}

extension NewsViewController: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.articles?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleNewsCell", for: indexPath) as? ArticleCell else {
            return UICollectionViewCell()
        }
        if let article = viewModel.articles?[indexPath.item] {
            cell.configure(with: article)
            cell.layer.cornerRadius = 10
            return cell
        } else {
            return cell
        }
    }

}

extension NewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 20, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}


