//
//  ChatroomPage.swift
//  chattapp-Kamilia Latifah
//
//  Created by Kamilia Latifah on 29/11/19.
//  Copyright © 2019 masaksendiri. All rights reserved.
//

import UIKit
import Firebase

class ChatroomPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoutbutton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        self.navigationItem.leftBarButtonItem = logoutbutton
        self.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barTintColor = .white
        view.backgroundColor = .systemRed
    }
    
    @objc func handleLogout(){
        let loginController  = LoginPage()
        loginController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(loginController, animated: true)
    }
}
