//
//  ViewController.swift
//  UIKit - 12 - dz
//
//  Created by Олег Дмитриев on 23.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let sectionsData = CollectionSection.mockData()
    
    private lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        
        $0.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.reuseID)
        $0.register(MessageCell.self, forCellWithReuseIdentifier: MessageCell.reuseID)
        $0.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.reuseID)
        $0.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.reuseID)
        
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: createLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }
    
    // MARK: - sections all
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            
            switch section {
                case 0: return self.storySection()
                case 1: return self.messageSection()
                case 2: return self.newsSection()
                case 3: return self.bannerSection()
                default: return self.storySection()
            }
            
        }
    }
    
    // MARK: - section story
    private func storySection() -> NSCollectionLayoutSection {
        
        // blocks
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // groups
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(94), heightDimension: .absolute(104))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 14)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    // MARK: - section message
    private func messageSection() -> NSCollectionLayoutSection {
        
        // blocks
        let itemsSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemsSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        
        // groups -> vertical is working only 16+ ios
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.82), heightDimension: .estimated(96))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 14)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 45, leading: 20, bottom: 30, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
        
    }
    
    // MARK: - section news
    private func newsSection() -> NSCollectionLayoutSection {

        // blocks
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // groups
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.82), heightDimension: .absolute(152))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 14)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        section.orthogonalScrollingBehavior = .groupPaging
        
        // Supplementary Item
        // let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        // let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: "header", alignment: .top)
        // section.boundarySupplementaryItems = [headerItem]

        return section
    }
    
    // MARK: - section banner
    private func bannerSection() -> NSCollectionLayoutSection {
        
        // blocks
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        
        // groups -> vertical is working only 16+ ios
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(216))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 45, leading: 20, bottom: 30, trailing: 20)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        return section
    }

}

extension ViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sectionsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sectionsData[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = sectionsData[indexPath.section].items[indexPath.item]
        
        switch indexPath.section {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.reuseID, for: indexPath) as! StoryCell
                cell.setupCell(item: item)
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageCell.reuseID, for: indexPath) as! MessageCell
                cell.setupCell(item: item)
                return cell
            case 2:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.reuseID, for: indexPath) as! NewsCell
                cell.setupCell(item: item)
                return cell
            case 3:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.reuseID, for: indexPath) as! BannerCell
                cell.setupCell(item: item)
                return cell
            default: return UICollectionViewCell()
        }
    }

}
