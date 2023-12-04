//
//  DisplayEventViewController.swift
//  FitTogether
//
//  Created by retrouvailles on 11/28/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class DisplayEventViewController: UIViewController {
    
    let displayEventScreen = DisplayEventView()
    
    var activitiesList = [Activity]()
    
    var currentUser:FirebaseAuth.User?
    
    let database = Firestore.firestore()
    
    override func loadView() {
        view = displayEventScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayEventScreen.tableViewActivities.delegate = self
        displayEventScreen.tableViewActivities.dataSource = self
        displayEventScreen.tableViewActivities.separatorStyle = .none
        displayEventScreen.buttonShare.addTarget(self, action: #selector(onShareButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func onShareButtonTapped() {
        let shareAlert = UIAlertController(
            title: "Share with friends",
            message: "Please type friends email to continue.",
            preferredStyle: .alert)
        
        //MARK: setting up email textField in the alert...
        shareAlert.addTextField{ textField in
            textField.placeholder = "Enter email"
            textField.contentMode = .center
            textField.keyboardType = .emailAddress
        }
        
        
        
        let shareAction = UIAlertAction(title: "Share", style: .default, handler: {(_) in
            if let email = shareAlert.textFields![0].text {
                //generate new message and add to db
                var messageText : String = ""
                for activity in self.activitiesList {
                    messageText += activity.type + " "  + String(activity.quantity) + "  "
                    
                }
                
                let sender = self.currentUser?.email
                let receiver = email
                let date = Date()
                
                let message = Message(sender: sender!, receiver: receiver, messageText: messageText, date: date)
                
                self.saveMessageToFireStore(message: message)
            }
        })
        
        shareAlert.addAction(shareAction)
        self.present(shareAlert, animated: true, completion: {() in
            //MARK: hide the alerton tap outside...
            shareAlert.view.superview?.isUserInteractionEnabled = true
            shareAlert.view.superview?.addGestureRecognizer(
                UITapGestureRecognizer(target: self, action: #selector(self.onTapOutsideAlert))
            )
        })
    }
    
    @objc func onTapOutsideAlert(){
        self.dismiss(animated: true)
    }
    
    func saveMessageToFireStore(message: Message) {
        var messageRef: DocumentReference? = nil
        do {
            try messageRef = database.collection("messages").addDocument(from:  message) { err in
                if let err = err {
                    print(err)
                    return
                } else {
                    if let userEmail = self.currentUser!.email{
                        let collectionSentMessages = self.database
                            .collection("users")
                            .document(userEmail)
                            .collection("sentMessages")
                        do {
                            try collectionSentMessages.addDocument(from: messageRef, completion: {(error) in
                                if error == nil {
//                                    self.scrollToBottom()
                                    print("add succeed")
                                } else {
                                    print("add ref error")
                                }})
                        }catch {
                            print("outside do")
                        }
                    }
                }
            }
        } catch {
            print("error")
        }
    }
}
