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
    var notificationDataList:[NotificationDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationDataList =  generateNotificationDataModel()
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

//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if (editingStyle == .delete) {
//            // handle delete (by removing the data from your array and updating the tableview)
//            notificationDataList.remove(at: indexPath.row)
//            tableView.reloadData()
//        }
//    }
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
}



class NotificationListTableCell:UITableViewCell{
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    override func awakeFromNib() {
        
    }
    
    
    func setData(dataModel:NotificationDataModel){
        titleLbl.text =  dataModel.title
        timeLbl.text =  dataModel.time
        typeLbl.text =  dataModel.type
    }
    
}



func generateNotificationDataModel()->[NotificationDataModel]{
    
    var notificationDataModel:[NotificationDataModel] =  [NotificationDataModel]()
    
    let notificationTitle =  ["You received a group invitation", "Your order is confirmed by the restaurant!","Your IQ Guest Pass request is approved by John Doe!","You have received an IQ Guest Pass request from John Doe", "You Local Personal Monthly Plan is approved!", "Low balance notice", "You received a group invitation", "Your order is confirmed by the restaurant!","Your IQ Guest Pass request is approved by John Doe!","You have received an IQ Guest Pass request from John Doe"]
    let notificationType =  ["XYZ Parking", "PizzaHut", "WeWork", "IQ","IQ","IQ", "XYZ Parking", "PizzaHut", "WeWork", "IQ",]
    for index in 0..<10{
        notificationDataModel.append(NotificationDataModel(title: notificationTitle[index], type: notificationType[index], time: "3:30 PM"))
    }
    
    return notificationDataModel
}
struct NotificationDataModel{
    let title:String
    let type:String
    let time:String
}
