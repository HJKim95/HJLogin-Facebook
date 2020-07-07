//
//  ViewController.swift
//  FacebookLoginTest
//
//  Created by 김희중 on 2020/07/07.
//  Copyright © 2020 HJ. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class ViewController: UIViewController {
    
    let loginButton: FBLoginButton = {
        let fb = FBLoginButton()
        fb.permissions = ["public_profile", "email"]
        return fb
    }()
    
    lazy var customLoginButton: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .yellow
        iv.isUserInteractionEnabled = true
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(login)))
        return iv
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(customLoginButton)
        view.addSubview(loginButton)
        
        customLoginButton.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 50)
        loginButton.center = view.center
        
        if let token = AccessToken.current, !token.isExpired {
            // User is logged in, do work such as go to next view controller.
            print(123123)
            print(token)
            
        }
    }
    
    @objc fileprivate func login() {
        LoginManager().logIn(permissions: ["email" , "public_profile"], from: self) {
            (result, err) in
            if err != nil {
                print("Custom FB Login Failed", err ?? "")
                return
            }
            if result != nil {
                let facebook = Facebook()
                facebook.getFacebookInfo(imageSize: CGSize(width: 100, height: 100)) { (info) in
                    print(info.id)
                    print(info.name)
                    print(info.profile_image_url)
                }
            }
        }

    }
    
    @objc fileprivate func logout() {
        LoginManager().logOut()
    }

}

