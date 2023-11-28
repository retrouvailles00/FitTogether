//
//  AddEventViewController.swift
//  FitTogether
//
//  Created by retrouvailles on 11/27/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class AddEventViewController: UIViewController {
    
    var currentUser:FirebaseAuth.User?
    
    let addEventScreen = AddEventView()
    
    let database = Firestore.firestore()
    
    let childProgressView = ProgressSpinnerViewController()

    override func loadView() {
        view = addEventScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Add a New Event"
        
        addEventScreen.buttonAdd.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)
    }
    
    @objc func onAddButtonTapped() {
        if let intake = Int(addEventScreen.textFieldIntake.text ?? "0") {
            if let consume = Int(addEventScreen.textFieldConsume.text ?? "0") {
                let event = Event(intake: intake, consume: consume)
                saveEventToFireStore(event: event)
            }
        }
    }
    
    func saveEventToFireStore(event: Event) {
        if let userEmail = currentUser!.email {
            let collectionEvents = database
                .collection("users")
                .document(userEmail)
                .collection("events")
            do {
                try collectionEvents.addDocument(from: event, completion: {(error) in
                    if error == nil {
                        self.navigationController?.popViewController(animated: true)
                    }
                })
            } catch {
                print("Error adding document!")
            }
        }
    }
}

extension AddEventViewController:ProgressSpinnerDelegate{
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}
