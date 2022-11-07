//
//  DonationFrameTwoVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 25/07/2022.
//

import UIKit

class DonationFrameTwoVC: UIViewController {
    
    //MARK: - Outlet

    @IBOutlet weak var mealMakerTableView: UITableView!
    
    private var isSkeleton: Bool = true {
        didSet {
            self.mealMakerTableView.reloadData()
        }
    }
    var subWorthyCause:[Founder]=[]
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isSkeleton = true

        setupTableView()
    }

    private func setupTableView(){
        mealMakerTableView.register(MealMarkerTableViewCell.self)
       

        mealMakerTableView.delegate=self
        mealMakerTableView.dataSource=self
        self.isSkeleton = false

    }
    

    

}
 extension DonationFrameTwoVC :UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isSkeleton ? 3 : subWorthyCause.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartCell:MealMarkerTableViewCell=tableView.dequeueReusableCell(for: indexPath)
        guard !self.isSkeleton else {
            cartCell.startSkeleton()
            return cartCell
        }
        cartCell.stopSkeleton()
        cartCell.configureCell(item: subWorthyCause[indexPath.row])
        return cartCell
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         NotificationCenter.default.post(name: .init(rawValue: "GoodLife"), object: [2,mealMakerTableView.bounds.height,indexPath.row])
     }
    
    
}

extension DonationFrameTwoVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}
