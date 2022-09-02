//
//  signUpViewController.swift
//  pageControllerAppDemo
//
//  Created by iMac on 02/08/22.
//

import UIKit

class signUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnSignUpWithFB(_ sender: Any) {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
        present(home, animated: true, completion: nil)
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
