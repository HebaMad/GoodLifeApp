//
//  EditBusinessPlanVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 02/07/2023.
//

import UIKit

class EditBusinessPlanVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var businessplanTable: UITableView!
    
    //MARK: - Properties
    
    private var selectedIndex = -1
    var businessplanList:[businessplanDetails]=[]
    var businessplan:[String:String]=[:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableview()
        makeParameter()
    }
    
    func setupTableview(){
        businessplanTable.register(EditBusinessplanCell.self)
        businessplanTable.delegate=self
        businessplanTable.dataSource=self
        businessplanTable.rowHeight = 45
        
        
    }
    
    @IBAction func AddBtn(_ sender: Any) {
        
    }
}

extension EditBusinessPlanVC{
    
    @objc func saveButtonWasTapped(ـ sender:UIButton){
        print("businessplan")

        var superview = sender.superview
        
        while let view = superview, !(view is UITableViewCell) {
            superview = view.superview
        }
        
        guard let cell = superview as? UITableViewCell else {
            print("button is not contained in a table view cell")
            return
        }

        print("cell2")
        print((cell as! EditBusinessplanCell).planNameTxt.text)
         businessplan["business_plans[\(sender.tag)][name]"] =  (cell as! EditBusinessplanCell).planNameTxt.text ?? ""
         businessplan["business_plans[\(sender.tag)][url]"] =  (( cell as! EditBusinessplanCell).urlTxt.text ?? "")
        businessplan["business_plans[\(sender.tag)][market_size]"] = "\(( cell as! EditBusinessplanCell).marketSizeProgress.value )"
         businessplan["business_plans[\(sender.tag)][pros]"] = ( cell as! EditBusinessplanCell).planProsTxt.text ?? ""
         businessplan["business_plans[\(sender.tag)][cons]"] = ( cell as! EditBusinessplanCell).planConsTxt.text ?? ""
        
       print(businessplan)

    }
    
    

}

extension EditBusinessPlanVC:UITableViewDelegate{}

extension EditBusinessPlanVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businessplanList.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:EditBusinessplanCell=tableView.dequeueReusableCell(for: indexPath)
        cell.configureCell(businessplanData: businessplanList[indexPath.row])
        cell.saveChangesBtn.addTarget(self, action: #selector(saveButtonWasTapped), for: .touchUpInside)
        cell.saveChangesBtn.tag=indexPath.row
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! EditBusinessplanCell
        cell.OpendDataList.isHidden = !cell.OpendDataList.isHidden
        
        selectedIndex = indexPath.row
        tableView.beginUpdates()
        tableView.endUpdates()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if selectedIndex != -1 {
            let cell = tableView.cellForRow(at: indexPath) as? EditBusinessplanCell
            if indexPath.row == selectedIndex {
                
                cell?.showHideButton.transform = .init(rotationAngle: .pi)
                return 660
            }
            cell?.showHideButton.transform = .init(rotationAngle:0)
            return 45
        }
        return  45
        
    }
}

extension EditBusinessPlanVC {
    func makeParameter(){
        for index in 0 ..< businessplanList.count {
            businessplan["business_plans[\(index)][name]"] = businessplanList[index].name ?? ""
            businessplan["business_plans[\(index)][url]"] =  businessplanList[index].url ?? ""
            businessplan["business_plans[\(index)][market_size]"] = businessplanList[index].market_size ?? ""
            businessplan["business_plans[\(index)][pros]"] = businessplanList[index].pros ?? ""
            businessplan["business_plans[\(index)][cons]"] = businessplanList[index].cons ?? ""
        }
        print(businessplan)
    }
}
