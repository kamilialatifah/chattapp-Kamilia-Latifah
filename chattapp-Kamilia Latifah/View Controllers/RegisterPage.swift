//
//  RegisterPage.swift
//  chattapp-Kamilia Latifah
//
//  Created by Kamilia Latifah on 01/12/19.
//  Copyright © 2019 masaksendiri. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterPage: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var textfieldfirstnameSU: UITextField!
    @IBOutlet weak var textfieldlastnameSU: UITextField!
    @IBOutlet weak var textfieldemailSU: UITextField!
    @IBOutlet weak var textfieldpasswordSU: UITextField!
    @IBOutlet weak var signupoutlet: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var uploadimage: UIImageView!
    
    //MARK: - Viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()

        //view
        view.backgroundColor =  #colorLiteral(red: 0.2117647059, green: 0.3294117647, blue: 0.6705882353, alpha: 1)
        signupoutlet.layer.cornerRadius = 5
    }

    @IBAction func xbuttonaction(_ sender: Any) {
        loginsetup()
    }
    
    @IBAction func signupaction(_ sender: Any) {
        guard let email = textfieldemailSU.text else { return }
        guard let password = textfieldpasswordSU.text else { return }
        guard let firstname = textfieldfirstnameSU.text else { return }
        guard let lastname = textfieldfirstnameSU.text else { return }
        
        createUser(withEmail: email, password: password, firstname: firstname, lastname: lastname)
    }
    
    func loginsetup(){
        let loginpage = LoginPage()
        loginpage.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(loginpage, animated: true)
    }
    
    func createUser(withEmail email: String, password: String, firstname: String, lastname: String) {
        
        // validate the fields
        let  error  = validateFields()
        if error != nil {
        // there's something wrong with the field, show error message
        showError(error!)
        }
        else {
            
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Failed to sign user up with error: ", error.localizedDescription)
                return
            }
            guard let uid = result?.user.uid else { return }
            let values = ["email": email, "firstname": firstname, "password": password, "lastname": lastname]
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { (error, ref) in
                if let error = error {
                    print("Failed to update database values with error: ", error.localizedDescription)
                    return
                }
                     // transition to chatroom
                    self.loginsetup()
            })
        }
    }
}
    func validateFields() -> String? {
        //check that all fields are filled  in
        if textfieldfirstnameSU.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || textfieldlastnameSU.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            textfieldemailSU.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || textfieldpasswordSU.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields!"
        }
        return nil
    }
    
    //check the fields and validate that  the data is correct. If everything is correct,  this method returns nil.  Otherwise, it return  error message
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
}
