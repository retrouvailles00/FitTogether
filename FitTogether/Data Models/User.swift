//
//  User.swift
//  FitTogether
//
//  Created by retrouvailles on 11/27/23.
//

import Foundation
import FirebaseFirestoreSwift
import UIKit

struct User: Codable{
    @DocumentID var id: String?
    var name: String
    var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}
