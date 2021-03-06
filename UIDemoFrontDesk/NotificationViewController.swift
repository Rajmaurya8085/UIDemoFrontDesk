//
//  NotificationViewController.swift
//  UIDemoFrontDesk
//
//  Created by Raj Maurya on 31/10/20.
//  Copyright © 2020 Raj Maurya. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
    
    @IBOutlet weak var notificationTableView: UITableView!
    @IBOutlet weak var unreadNotificationView:UIView?
    
    var notificationDataList:[NotificationDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         self.title =  "Notifications"
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationDataList =  generateNotificationDataModel()
    }
    
    @IBAction func didClearButtonClicked(){
        unreadNotificationView?.isHidden =  true
        notificationTableView.reloadData()
        notificationDataList.removeAll()
    }
}

extension NotificationViewController:UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationDataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableCell =  tableView.dequeueReusableCell(withIdentifier: "NotificationListTableCell", for: indexPath) as? NotificationListTableCell else { return  UITableViewCell() }
        tableCell.setData(dataModel: notificationDataList[indexPath.row])
        tableCell.selectionStyle =  .none
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: nil) {  (contextualAction, view, boolValue) in
            self.deleteData(at: indexPath)
        }
        deleteAction.backgroundColor =  UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.0)
        deleteAction.image =  UIImage(named:"group2")
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])

        return swipeActions
    }

    func deleteData(at indexPath: IndexPath) {
       notificationDataList.remove(at: indexPath.row)
       notificationTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        notificationDataList[indexPath.row].isUread =  false
        notificationTableView.reloadData()
    }
}



class NotificationListTableCell:UITableViewCell{
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var unreadImageView: UIImageView!
    @IBOutlet weak var pointWidthConst: NSLayoutConstraint!
    @IBOutlet weak var pointLeadingConst: NSLayoutConstraint!
    
    override func awakeFromNib() {
        
    }
    
    
    
    func setData(dataModel:NotificationDataModel){
        titleLbl.text =  dataModel.title
        timeLbl.text =  dataModel.time
        typeLbl.text =  dataModel.type
        if dataModel.isUread{
            unreadImageView.isHidden = false
            pointWidthConst.constant =  19.0
            pointLeadingConst.constant =  15
        }else{
            unreadImageView.isHidden = true
            pointWidthConst.constant =  0.0
            pointLeadingConst.constant =  0.0
        }
    }
}



