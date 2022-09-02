//
//  loginViewController.swift
//  pageControllerAppDemo
//
//  Created by iMac on 02/08/22.
//

/*
 Today I Worked On

 Working With Social log in with Facebook
 Access user details [[ “fields” : ” first_name, id, picture, name, email “]] , and show user data - Id name & image
 */
import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import AuthenticationServices
//import Security
import FBSDKLoginKit

class loginViewController: UIViewController {
    
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnOutGoogle: UIButton!
    @IBOutlet weak var btnOutfacebook: UIButton!
    @IBOutlet weak var btnOutApple: UIButton!
    
    var login = loginAndSignup.login
    var heading:String?
    var Description:String?
    var Google:String?
    var facebook:String?
    var apple:String?
    var getFaceBookProfileImage:Data?
    
    var isMFAEnabled = false
    
    var handle: AuthStateDidChangeListenerHandle?
    
    enum AuthProvider {
        case authEmail
        case authApple
        case authFacebook
        case authGoogle
        case authTwitter
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblHeading.text = heading
        lblDescription.text = Description
        btnOutGoogle.setTitle(Google, for: .normal)
        btnOutfacebook.setTitle(facebook, for: .normal)
        btnOutApple.setTitle(apple, for: .normal)
    }
    
    @IBAction func btnLoginWithGoogle(_ sender: Any) {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
        
        if self.login == loginAndSignup.login{
            print("Login Done")
            
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            // Create Google Sign In configuration object.
            let config = GIDConfiguration(clientID: clientID)
            
            GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard
                    let userInfo = user
                else {
                    return
                }
                let nav2 = UINavigationController(rootViewController: home)
                nav2.modalPresentationStyle = .overFullScreen
                nav2.modalTransitionStyle = .flipHorizontal
                nav2.isNavigationBarHidden = true
                
                let personVc = home.viewControllers![4] as! personViewController
                home.selectedIndex = 4
                personVc.getUserName = userInfo.profile?.name
                
                if !userInfo.profile!.hasImage{
                    personVc.getUserImage = UIImage(named: "google (1)")
                }else{
                    let url = userInfo.profile?.imageURL(withDimension: 320)
                    let data = try? Data(contentsOf: url!)
                    
                    
                    if let imageData = data {
                        personVc.getUserImage = UIImage(data: imageData)
                    }
                }
                
                self.present(nav2, animated: true, completion: nil)
                print(userInfo.profile)
            }
            
        }else{
            print("Sign Up Method Is Not Set")
        }
    }
    
    @IBAction func buttonFacebookAction(_ sender: Any) {
        
        
        if self.login == loginAndSignup.login{
            print("Login Done")
            self.facebookLoginButton()
            
        }else{
            print("Sign Up Method Is Not Set")
        }
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
}

extension loginViewController {
    
    func facebookLoginButton() {
        let fbLoginManager: LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbresult: FBSDKLoginKit.LoginManagerLoginResult = result!
                
                if fbresult.grantedPermissions != nil {
                    if(fbresult.grantedPermissions.contains("email")){
                        self.facebookLogin()
                    }else{
                        print(error?.localizedDescription as Any)
                    }
                }
            }
            else{
                print(error?.localizedDescription ?? "")
                print("login error")
            }
        }
    }
    
    func facebookLogin() {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
        let nav2 = UINavigationController(rootViewController: home)
        nav2.modalPresentationStyle = .overFullScreen
        nav2.modalTransitionStyle = .flipHorizontal
        nav2.isNavigationBarHidden = true
        
        let personVc = home.viewControllers![4] as! personViewController
        home.selectedIndex = 4
        
        if((AccessToken.current) != nil) {
            GraphRequest(graphPath: "me", parameters: ["fields":"first_name, id, picture, name,email"]).start { connection, result, error in
                if result == nil {
                    print(error?.localizedDescription ?? "")
                }else{
                    let userResults = result as! [String : AnyObject]
                    
                    let fullName = (userResults["name"] as? String) ?? ""
                    print(fullName)
                    personVc.getUserName = fullName
                    let name = (userResults["first_name"] as? String) ?? ""
                    print(name)
                    let id = (userResults["id"] as? String) ?? ""
                    print(id)
                    let email = (userResults["email"] as? String) ?? ""
                    print(email)
                    
                    if let pp = userResults["picture"] as? [String:Any],let data = pp["data"] as? [String:Any] , let url = data["url"] as? String {
                        if let data = try? Data(contentsOf: URL(string: url)!)
                        {
                            personVc.getUserImage = UIImage(data: data)
                        }
                    }
                    
                    self.present(nav2, animated: true, completion: nil)
                }
            }
        }
    }
}

extension String {
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
            return UIImage(data: data)
        }
        return nil
    }
}

