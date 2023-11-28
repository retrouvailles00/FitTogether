//
//  Event.swift
//  FitTogether
//
//  Created by retrouvailles on 11/27/23.
//

import Foundation
import FirebaseFirestoreSwift
import UIKit

struct Event: Codable{
    @DocumentID var id: String?
    var intake: Int
    var consume: Int
    
    init(intake: Int, consume: Int) {
        self.intake = intake
        self.consume = consume
    }
}
