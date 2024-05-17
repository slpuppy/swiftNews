//
//  HomeViewController.swift
//  SwiftNews
//
//  Created by Gabriel Puppi on 13/05/24.
//

import UIKit

class NewsViewController: UIViewController {
    
    private var viewModel: NewsViewModelProtocol
    
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
    
    // MARK: Initialization
    
    init(viewModel: NewsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        self.headerView.setupCategories(categories: viewModel.categories)
        self.headerView.delegate = self
        self.fetchNews()
    }
    
    // MARK: UI Setup
    
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
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
    
    // MARK: Private methods
    
    private func fetchNews(){
        Task {
            let result = await viewModel.loadMoreNews()
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch: \(error)")
            }
            
        }
    }
}

// MARK: Delegate methods

extension NewsViewController: NewsCollectionViewHeaderDelegate, LoadMoreFooterViewDelegate {
    
    func didTapCategory(category: NewsCategory) {
        if category != viewModel.selectedCategory {
            viewModel.selectCategory(category: category)
            Task {
                    let result = await viewModel.loadMoreNews()
                    switch result {
                    case .success:
                        DispatchQueue.main.async {
                            self.headerView.updateSelectedCategory(selectedCategory: category)
                            self.scrollToTopIfNeeded()
                            self.collectionView.reloadData()
                        }
                    case .failure(let error):
                        print("Failed to fetch: \(error)")
                    }
            }
        } else {
            return
        }
    }
    
    func didTapLoadMore() {
        self.fetchNews()
    }
}

extension NewsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleNewsCell", for: indexPath) as? ArticleCell else {
            return UICollectionViewCell()
        }
        let article = viewModel.articles[indexPath.item]
        cell.configure(with: article)
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.presentArticle(articleIndex: indexPath.row)
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

extension NewsViewController {
    
    func scrollToTop() {
        let indexPath = IndexPath(item: 0, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
    }
    
    func shouldScrollToTop() -> Bool {
        let yOffsetThreshold: CGFloat = 16
        return collectionView.contentOffset.y > yOffsetThreshold
    }
    
    func scrollToTopIfNeeded() {
        if shouldScrollToTop() {
            scrollToTop()
        }
    }
}











