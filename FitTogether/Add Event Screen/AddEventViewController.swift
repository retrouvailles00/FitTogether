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
    
    var selectedIntakeType = "fruit"
    
    var selectedConsumeType = "gym"
    
    var event = Event()
    
    var totalIntake: Int = 0
    var totalConsume: Int = 0

    override func loadView() {
        view = addEventScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Add a New Event"
        
        addEventScreen.labelIntake.text = "Your Intake is: " + String(totalIntake)
        addEventScreen.labelConsume.text = "Your Consume is: " + String(totalConsume)
        
        addEventScreen.buttonAdd.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)
        
        addEventScreen.buttonSubmit.addTarget(self, action: #selector(onSubmitButtonTapped), for: .touchUpInside)
        
        addEventScreen.buttonIntakeSelectType.menu = getIntakeMenuTypes()
        addEventScreen.buttonConsumeSelectType.menu = getConsumeMenuTypes()
        
        
    }
    
    @objc func onAddButtonTapped() {
        if let intakeQuantity = Int(addEventScreen.textFieldIntake.text ?? "0") {
            switch selectedIntakeType {
                case "fruit":
                    event.fruit = event.fruit + intakeQuantity
                    totalIntake = totalIntake + 95 * intakeQuantity
                    break
                case "vegetable":
                    event.vegetable = event.vegetable + intakeQuantity
                    totalIntake = totalIntake + 55 * intakeQuantity
                    break
                case "protein":
                    event.protein = event.protein + intakeQuantity
                    totalIntake = totalIntake + 1250 * intakeQuantity
                    break
                default:
                    break
            }
        }
    
        if let consumeQuantity = Int(addEventScreen.textFieldConsume.text ?? "0") {
            switch selectedConsumeType {
                case "gym":
                    event.gym = event.gym + consumeQuantity
                    totalConsume = totalConsume + 200 * consumeQuantity
                    break
                case "hike":
                    event.hike = event.hike + consumeQuantity
                    totalConsume = totalConsume + 350 * consumeQuantity
                    break
                case "bike":
                    event.bike = event.bike + consumeQuantity
                    totalConsume = totalConsume + 300 * consumeQuantity
                    break
                default:
                    break
            }
        }
        event.intake = event.intake + totalIntake
        event.consume = event.consume + totalConsume
        addEventScreen.labelIntake.text = "Your Intake is: " + String(totalIntake)
        addEventScreen.labelConsume.text = "Your Consume is: " + String(totalConsume)
        addEventScreen.textFieldIntake.text = ""
        addEventScreen.textFieldConsume.text = ""
        addEventScreen.buttonIntakeSelectType.menu = getIntakeMenuTypes()
        addEventScreen.buttonConsumeSelectType.menu = getConsumeMenuTypes()
    }
    
    @objc func onSubmitButtonTapped() {
        saveEventToFireStore(event: self.event)
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
    
    func getIntakeMenuTypes() -> UIMenu {
        var menuItems = [UIAction]()
                
        for type in Utilities.intakeTypes{
            let menuItem = UIAction(title: type, handler: {(_) in
                                self.selectedIntakeType = type
                                self.addEventScreen.buttonIntakeSelectType.setTitle(self.selectedIntakeType, for: .normal)
                            })
            menuItems.append(menuItem)
        }
        return UIMenu(title: "Select type", children: menuItems)
    }
    
    func getConsumeMenuTypes() -> UIMenu {
        var menuItems = [UIAction]()
                
        for type in Utilities.consumeTypes{
            let menuItem = UIAction(title: type, handler: {(_) in
                                self.selectedConsumeType = type
                                self.addEventScreen.buttonConsumeSelectType.setTitle(self.selectedConsumeType, for: .normal)
                            })
            menuItems.append(menuItem)
        }
        return UIMenu(title: "Select type", children: menuItems)
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
