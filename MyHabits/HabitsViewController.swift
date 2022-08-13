//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Konstantin Bolgar-Danchenko on 10.08.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabit))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addHabit() {
        print("add button pressed")
    }
}
