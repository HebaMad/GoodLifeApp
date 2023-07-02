//
//  DigitalOpportunitiesCreation.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/03/2023.
//

import UIKit

class DigitalOpportunitiesCreation: UIViewController {

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var opportunitiesUrl: BottomBorderTextField!
    
    @IBOutlet weak var competitorUrl: BottomBorderTextField!
    @IBOutlet weak var tableConstant: NSLayoutConstraint!
    @IBOutlet weak var competitorLinksTableview: UITableView!
    
    var competitorsUrl:[String]=[]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindButtons()
        bindTextField()
        setupTableview()
    }
    
    func setupTableview(){
        competitorLinksTableview.register(websiteCompetitor.self)
        competitorLinksTableview.delegate=self
        competitorLinksTableview.dataSource=self
    }

    @objc func deleteBtnWasTapped(_ sender:UIButton){
        competitorsUrl.remove(at: sender.tag)
        competitorLinksTableview.reloadData()
        
    }
    
    
}

extension DigitalOpportunitiesCreation{
    
    func bindButtons(){
        addBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
    func bindTextField(){
        competitorUrl.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        opportunitiesUrl.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

    }
    
    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
  
        case addBtn:
            if competitorUrl.text != "" && competitorUrl.text != "https://"{
                competitorsUrl.append(competitorUrl.text!)
                competitorUrl.text="https://"
                competitorLinksTableview.isHidden=false
                competitorLinksTableview.reloadData()
                tableConstant.constant=CGFloat(competitorsUrl.count * 50)
            }else{
                showSnackBar(message: "Add your Financial Model ")
            }

        default:
            print("")
        }
    }
    
    
    @objc func textFieldDidChange(textField: UITextField){
        
        guard let text = textField.text else { return }
        
        
        if !text.hasPrefix("https://") {
            textField.text = "https://" + " " + text
        }
    }
}


extension DigitalOpportunitiesCreation:UITableViewDelegate{}
extension DigitalOpportunitiesCreation:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return competitorsUrl.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:websiteCompetitor = tableView.dequeueReusableCell(for: indexPath)
        cell.copyLink.isHidden = true
        cell.deleteBtn.isHidden = false
        cell.deleteBtn.tag = indexPath.row
        cell.deleteBtn.addTarget(self, action: #selector(deleteBtnWasTapped), for: .touchUpInside)
        cell.urlTxt.text=competitorsUrl[indexPath.row]

        return cell
    }
    
    
}
