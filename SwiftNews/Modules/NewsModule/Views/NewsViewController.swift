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
    
    private let headerView = NewsCollectionViewHeader()
    
    private lazy var collectionView: UICollectionView = {
        let layout = createCompositionalLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ArticleCell.self, forCellWithReuseIdentifier: "ArticleNewsCell")
        collectionView.register(LoadMoreFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: LoadMoreFooterView.reuseIdentifier)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(hex: "171717")
        return collectionView
    }()
    
    private var newsList: [Article] = []
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        self.headerView.setupCategories(categories: viewModel.categories)
        self.headerView.delegate = self
        self.fetchNews()
    }
    
    private func setupSubviews() {
        self.view.backgroundColor = UIColor(hex: "171717")
        view.addSubview(headerView)
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(224))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(224))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 16, trailing: 16)
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        section.boundarySupplementaryItems = [footer]
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func fetchNews(){
        viewModel.getNews() { [weak self] result in
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

extension NewsViewController: NewsCollectionViewHeaderDelegate, LoadMoreFooterViewDelegate {
    
    func didTapCategory(category: NewsCategory) {
        if category != viewModel.selectedCategory {
            viewModel.selectCategory(category: category)
            viewModel.getNews { [weak self] result in
                switch result {
                case .success(_):
                    DispatchQueue.main.async {
                        self?.headerView.updateSelectedCategory(selectedCategory: category)
                        self?.collectionView.reloadData()
                    }
                case .failure(_):
                    print("Failed to fetch")
                }
            }
        } else {
            return
        }
    }
    
    func didTapLoadMore() {
        viewModel.loadMoreNews { [weak self] result in
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let article = viewModel.articles?[indexPath.row] {
            viewModel.presentArticle(article: article)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LoadMoreFooterView.reuseIdentifier, for: indexPath) as! LoadMoreFooterView
            footerView.delegate = self
            return footerView
        } else {
            return UICollectionReusableView()
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



