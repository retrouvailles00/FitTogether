//
//  FriendsChatViewController.swift
//  FitTogether
//
//  Created by retrouvailles on 12/4/23.
//

import UIKit

class FriendsChatViewController: UIViewController {

    var friendsChatScreen = FriendsChatView()
    
    override func loadView() {
        view = friendsChatScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
