//
//  ResourceLessons.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/09/2022.
//

import UIKit

class ResourceLessons: UIViewController {

    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var lessonsTable: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    
    
    var lesson:[Lessons]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }

    func setupTable(){
        lessonsTable.register(ResourceCell.self)
        lessonsTable.delegate = self
        lessonsTable.dataSource = self
    }
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ResourceLessons:UITableViewDelegate{}
extension ResourceLessons:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lesson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ResourceCell = tableView.dequeueReusableCell(for: indexPath)
        cell.resourceTitleText.text = lesson[indexPath.row].title
        cell.resourceDetails.text = "Lesson \(indexPath.row + 1 )"

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = LessonDetails()
        vc.lesson = lesson[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
