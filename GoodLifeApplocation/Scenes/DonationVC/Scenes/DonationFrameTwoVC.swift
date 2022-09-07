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
    
    
    var subWorthyCause:[Founder]=[]
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    private func setupTableView(){
        mealMakerTableView.register(MealMarkerTableViewCell.self)
        
        mealMakerTableView.delegate=self
        mealMakerTableView.dataSource=self

    }
    

    

}
 extension DonationFrameTwoVC :UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        subWorthyCause.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartCell:MealMarkerTableViewCell=tableView.dequeueReusableCell(for: indexPath)
        cartCell.configureCell(item: subWorthyCause[indexPath.row])
        return cartCell
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         NotificationCenter.default.post(name: .init(rawValue: "GoodLife"), object: [2,mealMakerTableView.bounds.height])
     }
    
    
}

extension DonationFrameTwoVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}
