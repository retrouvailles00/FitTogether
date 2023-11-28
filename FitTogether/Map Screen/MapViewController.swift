//
//  MapViewController.swift
//  FitTogether
//
//  Created by retrouvailles on 11/28/23.
//

import UIKit

class MapViewController: UIViewController {
    
    let mapView = MapView()
        
    override func loadView() {
        view = mapView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
