//
//  choosingMinistryNeedsVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 20/08/2022.
//

import UIKit

class choosingMinistryNeedsVC: UIViewController {

    @IBOutlet weak var socialCommitmentsBtn: UIButtonDesignable!
    @IBOutlet weak var lifeBtn: UIButtonDesignable!
    @IBOutlet weak var movementLifeBtn: UIButtonDesignable!
    @IBOutlet weak var MinistrySubscriptionCollectionview: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMinistryCollectionview()
    }


    private func setupMinistryCollectionview(){
        MinistrySubscriptionCollectionview.register(SubscriptionCollectionViewCell.self)
        MinistrySubscriptionCollectionview.delegate=self
        MinistrySubscriptionCollectionview.dataSource=self

    }
    
    @objc func ministrySubscriptionDetails(){
        
      let vc = PackageDetailsVC()
        navigationController?.pushViewController(vc, animated: true)
    }

}
extension choosingMinistryNeedsVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:SubscriptionCollectionViewCell=collectionView.dequeueReusableCell(for: indexPath)
        cell.tag=indexPath.row
        cell.nextBtn.addTarget(self, action: #selector(ministrySubscriptionDetails), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (self.view.frame.width - 20)/2.5, height: 380)
        
    }
}
