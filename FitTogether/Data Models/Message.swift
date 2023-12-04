//
//  Message.swift
//  FitTogether
//
//  Created by retrouvailles on 12/4/23.
//

import Foundation
import FirebaseFirestoreSwift
import UIKit

struct Message: Codable{
    @DocumentID var id: String?
    var sender: String
    var receiver: String
    var messageText: String
    var date: Date
    
    init(sender: String, receiver: String, messageText: String, date: Date) {
        self.sender = sender
        self.receiver = receiver
        self.messageText = messageText
        self.date = date
    }
}
