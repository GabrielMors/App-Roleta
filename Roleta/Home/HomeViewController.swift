//
//  ViewController.swift
//  Roleta
//
//  Created by Gabriel Mors  on 11/06/23.
//

import UIKit

class HomeViewController: UIViewController {

    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

}

