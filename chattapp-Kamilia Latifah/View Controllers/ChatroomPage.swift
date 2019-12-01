//
//  ChatroomPage.swift
//  chattapp-Kamilia Latifah
//
//  Created by Kamilia Latifah on 29/11/19.
//  Copyright © 2019 masaksendiri. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ChatroomPage: UIViewController {
    
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoutbutton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        self.navigationItem.leftBarButtonItem = logoutbutton
        
        chatroomView()
    }
    
    @objc func handleLogout(){
        let loginController  = LoginPage()
        loginController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(loginController, animated: true)
    }
    
    func handleNewMessage()  {
        let chatpage = ChatroomPage()
        chatpage.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(chatpage, animated: true)
    }
    
    func checkIfUserIsLoggedIn() {
        let ref = Database.database().reference()
        var subchild = ref.child("users/firstname")
        ref.observeSingleEvent(of: .value, with: { snapshot in
            let name = snapshot.value as? String
            self.navigationItem.title = "\(name)"
    }
)}

    func chatroomView(){
        self.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.6784313725, green: 0.7215686275, blue: 0.8509803922, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.6784313725, green: 0.7215686275, blue: 0.8509803922, alpha: 1)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        checkIfUserIsLoggedIn()
    }
    
}
