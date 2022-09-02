//
//  secondViewController.swift
//  pageControllerAppDemo
//
//  Created by iMac on 02/08/22.
//

import UIKit

class welcomeViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLoginAction(_ sender: Any) {
        let login = self.storyboard?.instantiateViewController(withIdentifier: "loginViewController") as! loginViewController
        login.login = loginAndSignup.login
        login.heading = "Login"
        login.Description = "Login with social networks"
        login.Google = "Login With Google"
        login.facebook = "Login With Facebook"
        login.apple = "Login With Apple"
        self.navigationController?.pushViewController(login, animated: true)
    }
    
    @IBAction func btnSignUpAction(_ sender: Any) {
        let signUp = self.storyboard?.instantiateViewController(withIdentifier: "loginViewController") as! loginViewController
        signUp.login = loginAndSignup.signUp
        signUp.heading = "Sign Up"
        signUp.Description = "Sign Up with social networks"
        signUp.Google = "Sign Up With Google"
        signUp.facebook = "Sign Up With Facebook"
        signUp.apple = "Sign Up With Apple"
        self.navigationController?.pushViewController(signUp, animated: true)
    }
    
}
