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
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func buttonRegisterAction(_ sender: Any) {
        
       let chatroom = ChatroomPage()
        chatroom.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(chatroom, animated: true)
        loginHandler()
        
    }
    
    func loginHandler() {
        
        guard let email = textfieldEmail.text, let password = textfieldPassword.text else {
            print("Form is not valid")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
          // ...
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
