//
//  CreateOppourtinityVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 17/11/2022.
//

import UIKit

class CreateOppourtinityVC: UIViewController{
    
    @IBOutlet weak var tagCollectionview: UICollectionView!
    @IBOutlet weak var mobileNumber: BottomBorderTextField!
    @IBOutlet weak var emailTxt: BottomBorderTextField!
    @IBOutlet weak var TitleTxt: UITextField!
    @IBOutlet weak var cityTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var descriptionTxt: UITextView!
    
    @IBOutlet weak var phoneNumberTxt: BottomBorderTextField!
    @IBOutlet weak var stateTxt: UITextField!
    @IBOutlet weak var ratingView: RatingControl!
    
    
    var placeholder = "Please add a short description"
    var tagSelection:[String] = ["Investment","Donation"]
    let presenter=MainPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTxtviewCustomization()
        setupCollectionview()
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func sendBtn(_ sender: Any) {
        do{
            
            let name = try nameTxt.validatedText(validationType: .requiredField(field: "Name  required"))
            let title = try TitleTxt.validatedText(validationType: .requiredField(field: "Title required"))
            let state = try stateTxt.validatedText(validationType: .requiredField(field: "State required"))
            let city = try cityTxt.validatedText(validationType: .requiredField(field: "City required"))
            
            if  descriptionTxt.text != "" {
                
                if ratingView.rating != 0 {
                    
                    if tagSelection.count != 0 {
                        
                        presenter.createOpportunities(title:title, city: city, state: state, description: descriptionTxt.text!, name: name, tags: tagSelection, rating: "\(ratingView.rating)", email: emailTxt.text ?? "", phone:phoneNumberTxt.text ?? "" )
                        presenter.delegate=self
                        
                    }else{
                        Alert.showErrorAlert(message: "Select your tag please")
                        
                    }
                }else{
                    Alert.showErrorAlert(message: "Rate your opportunities please")
                }
                
            }else{
                
                Alert.showErrorAlert(message: "Fill the description please  ")
            }
            
        }catch{
            Alert.showErrorAlert(message: (error as! ValidationError).message)
            
        }
        
    }
    
}

extension CreateOppourtinityVC{
    
    func descriptionTxtviewCustomization(){
        descriptionTxt.layer.cornerRadius = 8.0
        descriptionTxt.layer.borderColor = UIColor(named: "bg5")?.cgColor
        descriptionTxt.layer.borderWidth=0.5
        descriptionTxt.text = "Add a short description"
        descriptionTxt.textColor = UIColor.lightGray
        descriptionTxt.delegate=self
    }
    
    func setupCollectionview(){
        tagCollectionview.layer.cornerRadius = 8.0
        tagCollectionview.layer.borderColor = UIColor(named: "bg5")?.cgColor
        tagCollectionview.layer.borderWidth=0.5
        
        tagCollectionview.register(HobbiesCell.self)
        tagCollectionview.register(UINib(nibName:"TagSelectionCollectionReusableView", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: TagSelectionCollectionReusableView.HeaderIdentifier)
        
        tagCollectionview.collectionViewLayout = createCompositionalLayout()
        tagCollectionview.delegate=self
        tagCollectionview.dataSource=self
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else {return nil}
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(40))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.99), heightDimension: .estimated(1))
            
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
            let section = NSCollectionLayoutSection(group: group)
            
            //                section.orthogonalScrollingBehavior = .continuous
            section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
            section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
            section.supplementariesFollowContentInsets = false
            return section
        }
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
}



//MARK: - confirm to Storyboarded protocol

extension CreateOppourtinityVC:Storyboarded{
    static var storyboardName: StoryboardName = .main
}


extension CreateOppourtinityVC:UICollectionViewDelegate{}
extension CreateOppourtinityVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tagSelection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:HobbiesCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.hobbiesTitle.text=tagSelection[indexPath.row]
        cell.deleteItemBtn.isHidden=false
        cell.deleteItemBtn.tag=indexPath.row
        cell.deleteItemBtn.addTarget(self, action: #selector(deleteTappedBtn), for: .touchUpInside)
        return cell
    }
    
    
}

extension CreateOppourtinityVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TagSelectionCollectionReusableView.HeaderIdentifier, for: indexPath) as! TagSelectionCollectionReusableView
        header.addBtn.tag=indexPath.row
        header.addBtn.addTarget(self, action: #selector(AddTappedBtn), for: .touchUpInside)
        
        return header
        
    }
    
}

extension CreateOppourtinityVC{
    @objc func deleteTappedBtn(sender:UIButton){
        let indexPath = NSIndexPath(row: sender.tag, section: 0)
        let cell:HobbiesCell = tagCollectionview.cellForItem(at: indexPath as IndexPath) as! HobbiesCell
        
        if cell.hobbiesTitle.text != ""{
            tagSelection.remove(at: indexPath.row)
            tagCollectionview.reloadData()
        }
    }
    
    @objc func AddTappedBtn(sender:UIButton){
        //        let indexPath = NSIndexPath(row: sender.tag, section: 1)
        let header:TagSelectionCollectionReusableView = tagCollectionview.supplementaryView(forElementKind: UICollectionView.elementKindSectionHeader, at: IndexPath(item: 0, section: sender.tag)) as! TagSelectionCollectionReusableView
        
        if  header.tagSelectionTitle.text != ""{
            tagSelection.append(header.tagSelectionTitle.text ?? "")
            header.tagSelectionTitle.text = ""
            tagCollectionview.reloadData()
        }
    }
    
    
    func clearData(){
        nameTxt.text = ""
        tagSelection = ["Investment","Donation"]
        tagCollectionview.reloadData()
        cityTxt.text = ""
        stateTxt.text=""
        TitleTxt.text=""
        descriptionTxt.text=""
        phoneNumberTxt.text = ""
        emailTxt.text = ""
        ratingView.rating = 0
    }
}



extension CreateOppourtinityVC:UITextViewDelegate{
    //MARK:- TextView Delegates
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Please add a short description"
            textView.textColor = UIColor.lightGray
            placeholder = ""
        } else {
            placeholder = textView.text
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeholder = textView.text
    }
    
}

extension CreateOppourtinityVC:MainDelegate{
    func getExploreMapData(data: ExploreMap) {}
    
    func showAlerts(title: String, message: String) {
        Alert.showSuccessAlert(message:message)
        clearData()
    }
    
    func getMainScreenData(data: MainScreenData) {}
    
    func getOpportunitiesData(data: ListOpportunities) {}
    
    func getStandardCategoriesFiltering(categories: MainHomeCategories) { }
    
    func getsubCategoriesFiltering(categories: SubHomeCategories) { }

}
