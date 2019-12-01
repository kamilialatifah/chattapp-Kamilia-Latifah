//
//  LoginPage.swift
//  chattapp-Kamilia Latifah
//
//  Created by Kamilia Latifah on 29/11/19.
//  Copyright © 2019 masaksendiri. All rights reserved.
//

import UIKit
import Firebase

class LoginPage: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var textfieldEmail: UITextField!
    @IBOutlet weak var textfieldPassword: UITextField!
    @IBOutlet weak var buttonRegister: UIButton!
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var gif: UIImageView!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view()
    }
    
    // MARK: - Log In
    @IBAction func buttonLoginAction(_ sender: Any) {
       loginHandler()
    }
    
    func loginHandler() {
        
        // TODO: Validate Text Fields
        
        // Create cleaned versions of the text field
        let email = textfieldEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = textfieldPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                print(error!.localizedDescription)
            } else {
                let chatroompage = ChatroomPage()
                chatroompage.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(chatroompage, animated: true)
               }
        }
    }
    
    // MARK: - Register
    @IBAction func registerbuttonaction(_ sender: Any) {
        let registerpage = RegisterPage()
        registerpage.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(registerpage, animated: true)
    }

    func view() {
        
        view.backgroundColor = #colorLiteral(red: 0.2117647059, green: 0.3294117647, blue: 0.6705882353, alpha: 1)
        var gifImage = UIImage.gifImageWithName("paperplane")
               self.gif.image = gifImage
        self.navigationController?.navigationBar.isHidden = true
        buttonRegister.layer.cornerRadius = 5
        buttonSignUp.layer.cornerRadius = 5
    }

}
