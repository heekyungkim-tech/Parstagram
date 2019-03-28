//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Heekyung kim on 3/21/19.
//  Copyright © 2019 Heekyung kim. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password){(user,error) in
            if user != nil{
                self.performSegue(withIdentifier: "Loginsegue", sender: nil)
            }else{
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    
    @IBAction func SignUp(_ sender: Any) {
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error )in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("Error: \(error?.localizedDescription)")
            }
            
        }
    }
}
