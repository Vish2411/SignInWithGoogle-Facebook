//
//  personViewController.swift
//  pageControllerAppDemo
//
//  Created by iMac on 05/08/22.
//

import UIKit

class personViewController: UIViewController {

    @IBOutlet weak var lblGreeting: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    var getUserName:String?
    var getUserImage:UIImage?
    
    var gretting:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userName.text = getUserName
        self.userImage.image = getUserImage
    }

    @IBAction func btnNStoryB2Action(_ sender: UIButton) {
        let storyBoard2 : UIStoryboard = UIStoryboard(name: "Main2", bundle:nil)
        let next = storyBoard2.instantiateViewController(withIdentifier: "personSettingViewController") as! personSettingViewController
//        next.modalPresentationStyle = .overFullScreen
//        next.modalTransitionStyle = .flipHorizontal
//        self.present(next, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(next, animated: true)
    }
    
}
