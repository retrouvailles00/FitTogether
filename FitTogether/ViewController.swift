//
//  ViewController.swift
//  FitTogether
//
//  Created by retrouvailles on 11/16/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {
    
    let mainScreen = MainScreenView()
    
    var eventsList = [Event]()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    var currentUser:FirebaseAuth.User?
    
    let database = Firestore.firestore()
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil {
                //MARK: not signed in...
                self.currentUser = nil
                self.mainScreen.labelText.text = "Please sign in to see the notes!"
                self.mainScreen.floatingButtonAddEvent.isEnabled = false
                self.mainScreen.floatingButtonAddEvent.isHidden = true
                
                //MARK: Reset tableView...
                self.eventsList.removeAll()
                self.mainScreen.tableViewEvents.reloadData()
                
                //MARK: Sign in bar button...
                self.setupRightBarButton(isLoggedin: false)
                
            } else {
                //MARK: the user is signed in...
                self.currentUser = user
                self.mainScreen.labelText.text = "Welcome \(user?.displayName ?? "Anonymous")!"
                self.mainScreen.floatingButtonAddEvent.isEnabled = true
                self.mainScreen.floatingButtonAddEvent.isHidden = false
                
                //MARK: Logout bar button...
                self.setupRightBarButton(isLoggedin: true)
                
                //MARK: Observe Firestore database to display the contacts list...
                
                self.database.collection("users")
                    .document((self.currentUser?.uid)!)
                    .collection("events")
                    .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                        if let documents = querySnapshot?.documents{
                            self.eventsList.removeAll()
                            for document in documents{
                                do{
                                    let event  = try document.data(as: Event.self)
                                    self.eventsList.append(event)
                                }catch{
                                    print(error)
                                }
                            }
//                            self.eventsList.sort(by: {$0.name < $1.name})
                            self.mainScreen.tableViewEvents.reloadData()
                        }
                    })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Events"
        mainScreen.tableViewEvents.delegate = self
        mainScreen.tableViewEvents.dataSource = self
        mainScreen.tableViewEvents.separatorStyle = .none
        
        navigationController?.navigationBar.prefersLargeTitles = true
        view.bringSubviewToFront(mainScreen.floatingButtonAddEvent)
        mainScreen.floatingButtonAddEvent.addTarget(self, action: #selector(addEventButtonTapped), for: .touchUpInside)
    }
    
    @objc func addEventButtonTapped() {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }
    
    func signIn(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password)
    }

}

