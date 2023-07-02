//
//  LiturgicalOpportunitiesCreation.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 29/03/2023.
//

import UIKit

class LiturgicalOpportunitiesCreation: UIViewController {
    // MARK: - Outlets

    @IBOutlet weak var marketSize: UISlider!
    @IBOutlet weak var marketName: UITextField!
    @IBOutlet weak var marketRate: UILabel!
    
    @IBOutlet weak var addMoreMarket: UIButton!
    
    @IBOutlet weak var commonWayValueTxt: BottomBorderTextField!
    
    @IBOutlet weak var addMoreWays: UIButton!
    
    @IBOutlet weak var commonWaysTableview: UITableView!
    @IBOutlet weak var tableConstant: NSLayoutConstraint!

    
    // MARK: - Properties
    var commomWaysWorship:[String]=[]
    var marketGraph:[String:String]=[:]
    var marketGraphName:[String]=[]
    var marketGraphSize:[String]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindButtons()
        bindUISliderValue()
        setupTableview()
    }
    
    func setupTableview(){
        commonWaysTableview.register(websiteCompetitor.self)
        commonWaysTableview.delegate=self
        commonWaysTableview.dataSource=self
    }
    @objc func deleteBtnWasTapped(_ sender:UIButton){
        commomWaysWorship.remove(at: sender.tag)
        commonWaysTableview.reloadData()

    }


}
extension LiturgicalOpportunitiesCreation {
    
    func bindButtons(){
        
        addMoreMarket.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        addMoreWays.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
    }
    
    func bindUISliderValue(){
        marketSize.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    
    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
        case addMoreMarket:
            if marketName.text != "" && marketSize.value != 0.0{
                marketGraphName.append(marketName.text!)
                marketGraphSize.append("\(marketSize.value)")
                clearData()
                makeParameter(key: marketGraphName, value: marketGraphSize)

            }else{
                showSnackBar(message: "Add your Market Size")
            }
        case addMoreWays:
            if commonWayValueTxt.text != ""{
                commomWaysWorship.append(commonWayValueTxt.text!)
                commonWaysTableview.isHidden=false
                commonWayValueTxt.text=""
                commonWaysTableview.reloadData()
                tableConstant.constant=CGFloat(commomWaysWorship.count * 50)
            }else{
                showSnackBar(message: "Add Common ways to worship ")
            }

        default:
            print("")

        }
    }
    
    
}


extension LiturgicalOpportunitiesCreation{
        func makeParameter(key:[String],value:[String]) {
            marketGraph=[:]
            for indx in 0 ..< key.count{
                marketGraph["liturgical_graphs[\(indx)][title]"]=key[indx]
                marketGraph["liturgical_graphs[\(indx)][percentage]"]=value[indx]

            }
        }
    
    func clearData(){
        marketName.text=""
        marketSize.value=0.0
        marketRate.text="0%"
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        marketRate.text="\(Int(sender.value))%"
    }
}

extension LiturgicalOpportunitiesCreation:UITableViewDelegate{}
extension LiturgicalOpportunitiesCreation:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commomWaysWorship.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:websiteCompetitor = tableView.dequeueReusableCell(for: indexPath)
        cell.copyLink.isHidden = true
        cell.deleteBtn.isHidden = false
        cell.deleteBtn.tag = indexPath.row
        cell.deleteBtn.addTarget(self, action: #selector(deleteBtnWasTapped), for: .touchUpInside)
        cell.urlTxt.text=commomWaysWorship[indexPath.row]

        return cell
    }
    
    
}
