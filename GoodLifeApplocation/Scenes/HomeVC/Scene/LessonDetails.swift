//
//  LessonDetails.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/09/2022.
//

import UIKit
import AVKit
import AVFoundation

class LessonDetails: UIViewController{
    
    //MARK: - Outlet
    
    @IBOutlet weak var lessonDetailsCollectionview: UICollectionView!
    @IBOutlet weak var videoPlayer: UIView!
    
    //MARK: - Properties
    
    var lesson:Lessons?
    private let sections = LessontopicDetails.shared.AllCategories
    var playerViewController: AVPlayerViewController!
    var isplayed = false
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLessonData()
        
    }
    
    //MARK: - setupCollectionview
    
    func setupLessonData(){
        setupVidePlayer()
        lessonDetailsCollectionview.register(LessonDetailsCollectionCell.self)
        lessonDetailsCollectionview.register(UINib(nibName:"HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        lessonDetailsCollectionview.collectionViewLayout = createCompositionalLayout()
        lessonDetailsCollectionview.delegate = self
        lessonDetailsCollectionview.dataSource = self
        lessonDetailsCollectionview.reloadData()
    }
    //MARK: - setup video player
    
    
    private func setupVidePlayer(){
        if  let _url = lesson?.file{
            let urlvideoo = URL(string:_url)
            
            let asset2 = AVAsset(url: urlvideoo!)
            let playerItem = AVPlayerItem(asset: asset2)
            let player = AVPlayer(playerItem: playerItem)
            
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = videoPlayer.bounds
            playerLayer.videoGravity = .resizeAspect
            
            playerViewController = AVPlayerViewController()
            playerViewController.player = player
            playerViewController.player?.play()
            //gets the frame size of table view cell view
            playerViewController.view.frame = CGRect (x:0, y:0, width:videoPlayer.frame.size.width, height:videoPlayer.frame.size.height)
            
            videoPlayer.addSubview(playerViewController.view)
            
        }
    }
    
    
    //MARK: - backBtn
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}


//MARK: - Create CompositionalLayout

private extension LessonDetails{
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .overView:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(70))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                //                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.8))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            case .keyAspect:
                
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.5))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
                
            case .keyTakeaway:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.5))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
                
                
            }
            
        }
    }
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}

//MARK: - conform to UICollectionViewDelegate

extension LessonDetails:UICollectionViewDelegate{}

//MARK: - conform to UICollectionViewDataSource


extension LessonDetails:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch sections[section]{
        case .overView: return lesson?.overview?.count ?? 0
        case .keyAspect :return lesson?.key_aspects?.count ?? 0
        case .keyTakeaway:return lesson?.key_takeaways?.count ?? 0
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch sections[indexPath.section] {
        case .overView:
            let cell:LessonDetailsCollectionCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configureCell(title: lesson?.overview?[indexPath.row].title ?? "")
            return cell
            
        case .keyAspect:
            let cell:LessonDetailsCollectionCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configureCell(title: lesson?.key_aspects?[indexPath.row].title ?? "")
            return cell
            
        case .keyTakeaway:
            let cell:LessonDetailsCollectionCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configureCell(title: lesson?.key_takeaways?[indexPath.row].title ?? "")
            
            return cell
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
        header.editBtn.isHidden=true
        header.viewAllButton.isHidden = true
        header.setup(sections[indexPath.section].title)
        return header
    }
    
    
}

