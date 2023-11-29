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
    var fruit: Int
    var vegetable: Int
    var protein: Int
    var gym: Int
    var hike: Int
    var bike: Int
    
    init(intake: Int = 0, consume: Int = 0, fruit: Int = 0, vegetable: Int = 0, protein: Int = 0, gym: Int = 0, hike: Int = 0, bike: Int = 0) {
        self.intake = intake
        self.consume = consume
        self.fruit = fruit
        self.vegetable = vegetable
        self.protein = protein
        self.gym = gym
        self.hike = hike
        self.bike = bike
    }
}
