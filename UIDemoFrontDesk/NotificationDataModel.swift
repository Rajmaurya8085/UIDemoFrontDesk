//
//  NotificationDataModel.swift
//  UIDemoFrontDesk
//
//  Created by Raj Maurya on 01/11/20.
//  Copyright © 2020 Raj Maurya. All rights reserved.
//

import Foundation


func generateNotificationDataModel()->[NotificationDataModel]{
    
    var notificationDataModel:[NotificationDataModel] =  [NotificationDataModel]()
    let notificationTitle =  ["You received a group invitation", "Your order is confirmed by the restaurant!","Your IQ Guest Pass request is approved by John Doe!","You have received an IQ Guest Pass request from John Doe", "You Local Personal Monthly Plan is approved!", "Low balance notice", "You received a group invitation", "Your order is confirmed by the restaurant!","Your IQ Guest Pass request is approved by John Doe!","You have received an IQ Guest Pass request from John Doe"]
    let notificationType =  ["XYZ Parking", "PizzaHut", "WeWork", "IQ","IQ","IQ", "XYZ Parking", "PizzaHut", "WeWork", "IQ",]
    let notificationRead = [true, true, false, false, false, false, false, false, false, false]
    for index in 0..<10{
        notificationDataModel.append(NotificationDataModel(title: notificationTitle[index], type: notificationType[index], time: "3:30 PM", isUread: notificationRead[index]))
    }
    return notificationDataModel
}

struct NotificationDataModel{
    let title:String
    let type:String
    let time:String
    var isUread:Bool
}
