//
//  FriendsChatViewController.swift
//  FitTogether
//
//  Created by retrouvailles on 12/4/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class FriendsChatViewController: UIViewController {

    var friendsChatScreen = FriendsChatView()
    
    var friendsList = [User]()
    
    let database = Firestore.firestore()
    
    var currentUser:FirebaseAuth.User?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        self.database.collection("users")
            .addSnapshotListener(includeMetadataChanges: false, listener: { [self] querySnapshot, error in
                if let documents = querySnapshot?.documents{
                    self.friendsList.removeAll()
                    for document in documents{
                        do{
                            let user  = try document.data(as: User.self)
                            if (user.email != self.currentUser?.email) {
                                self.friendsList.append(user)
                            }
                        }catch{
                            print(error)
                        }
                    }
                    self.friendsChatScreen.tableViewFriends.reloadData()
                }
            })
    }
    
    override func loadView() {
        view = friendsChatScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        friendsChatScreen.tableViewFriends.delegate = self
        friendsChatScreen.tableViewFriends.dataSource = self
        friendsChatScreen.tableViewFriends.separatorStyle = .none
        
    }

}

extension FriendsChatViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewFriendsId, for: indexPath) as! FriendsTableViewCell
        cell.labelName.text =  friendsList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatViewController = ChatViewController()
        chatViewController.currentUser = currentUser
        chatViewController.currentReceiver = friendsList[indexPath.row].email
        navigationController?.pushViewController(chatViewController, animated: true)
    }
}
