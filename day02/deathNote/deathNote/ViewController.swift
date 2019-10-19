//
//  ViewController.swift
//  deathNote
//
//  Created by Harmun Rossouw on 2019/10/19.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: UI ELEMENTS
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
    }
    
    //MARK: ACTIONS
    @IBAction func doneButton(_ sender: Any) {
        nameLabel.text = "Default Text"
    }

    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if nameTextField.text != "" && descriptionTextField.text != "" {
            nameLabel.text = nameTextField.text
            descriptionLabel.text = descriptionTextField.text
        }
        
    }

}

