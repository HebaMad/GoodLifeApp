//
//  DonationFrameTwoVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 25/07/2022.
//

import UIKit

class DonationFrameTwoVC: UIViewController {
    @IBOutlet weak var mealMakerTableView: UITableView!
    
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
    4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartCell:MealMarkerTableViewCell=tableView.dequeueReusableCell(for: indexPath)
        return cartCell
    }
    
    
}
