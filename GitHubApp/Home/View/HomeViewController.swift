//
//  HomeViewController.swift
//  GitHubApp
//
//  Created by Blake McAnally on 7/24/21.
//

import UIKit

class HomeViewController: UICollectionViewController {
    
    private let viewModel = HomeViewModel()
    
    // MARK: UICollectionView
    
    private lazy var headerRegistration: UICollectionView.SupplementaryRegistration<ListHeader> = {
        UICollectionView.SupplementaryRegistration<ListHeader>(elementKind: "Header") { headerView, _, indexPath in
            headerView.textLabel.text = self.viewModel.sections[indexPath.section].title
        }
    }()
    
    private lazy var listCellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, UUID> = {
        UICollectionView.CellRegistration<UICollectionViewListCell, UUID> { cell, indexPath, item in
            var contentConfiguration = cell.defaultContentConfiguration()
            let row = self.viewModel.sections[indexPath.section].rows[indexPath.row]
            contentConfiguration.text = row.title
            contentConfiguration.image = UIImage(systemName: row.icon)
            cell.accessories = [.disclosureIndicator()]
            cell.contentConfiguration = contentConfiguration
        }
    }()
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<HomeViewModel.Section, UUID> = {
        let dataSource = UICollectionViewDiffableDataSource<HomeViewModel.Section, UUID>(
            collectionView: self.collectionView
        ) { collectionView, indexPath, item in
            collectionView.dequeueConfiguredReusableCell(
                using: self.listCellRegistration,
                for: indexPath,
                item: item
            )
        }
        
        dataSource.supplementaryViewProvider = { _, _, indexPath in
            self.collectionView.dequeueConfiguredReusableSupplementary(
                using: self.headerRegistration,
                for: indexPath
            )
        }
        
        return dataSource
    }()

    // MARK: Init
    
    init() {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.headerMode = .supplementary
        let layout = UICollectionViewCompositionalLayout.list(
            using: listConfiguration
        )
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("unimplemented")
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSearch()
        setupCollectionView()
    }
    
    // MARK: View Setup
    
    private func setupNavigationBar() {
        title = "Home"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus.circle"),
            primaryAction: UIAction { _ in
                unimplemented(self)
            }
        )
    }
    
    private func setupSearch() {
        let searchController = UISearchController(
            searchResultsController: HomeSearchResultsViewController()
        )
        searchController.searchBar.placeholder = "Search GitHub"
        navigationItem.searchController = searchController
    }
    
    private func setupCollectionView() {
        var snapshot = NSDiffableDataSourceSnapshot<HomeViewModel.Section, UUID>()
        snapshot.appendSections(viewModel.sections)
        for section in viewModel.sections {
            snapshot.appendItems(section.rows.map(\.id), toSection: section)
        }
        dataSource.apply(snapshot)
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        unimplemented(self)
    }
}
