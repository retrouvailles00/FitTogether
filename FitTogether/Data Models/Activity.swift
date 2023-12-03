//
//  Activity.swift
//  FitTogether
//
//  Created by retrouvailles on 12/3/23.
//

import Foundation
import FirebaseFirestoreSwift
import UIKit

struct Activity: Codable{
    @DocumentID var id: String?
    var type: String
    var quantity: Int
    init(type: String = "", quantity: Int = 0) {
        self.type = type
        self.quantity = quantity
    }
}
