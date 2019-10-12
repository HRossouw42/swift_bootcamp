//
//  ViewController.swift
//  rush00
//
//  Created by Harmun Rossouw on 2019/10/12.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    

    // login user with a loginButton that gets username from loginText
    func loginUser(input: String) {
        if input == "" {
            print("No username entered")
            return
        }
        else {
           print("User is \(input)")
        }
        
        let client = Client()
        //get token
        client.genTok{ (token) in
            print("Token is \(token)")
            //user requests in here with token
            client.getUserInfo(token: token, username: "\(input)") { firstName,lastName,login,photo  in
                print("User found with Firstname: \(firstName), Lastname: \(lastName), Login: \(login) Photo: \(photo)")
            }
        }
    }
    
    //button sender to loginuser
    @IBAction func loginButton(_ sender: Any) {
        let textInput = loginText.text!
        loginUser(input: textInput)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

