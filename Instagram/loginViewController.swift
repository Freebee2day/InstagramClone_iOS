//
//  loginViewController.swift
//  
//
//  Created by Phoebe Zhong  on 4/6/21.
//

import UIKit
import Parse

class loginViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func LoginBTN(_ sender: Any) {
        let username = usernameTF.text!
        let password = passwordTF.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (myUser, myError) in
            if myUser != nil{
                self.performSegue(withIdentifier: "EntrySegue", sender: nil)
            }else{
                print("Error logging in: \(myError?.localizedDescription)")
            }
        }
        
    }
    
    @IBAction func SignUpBTN(_ sender: Any) {
        let user = PFUser()
        user.username = usernameTF.text
        user.password = passwordTF.text
        
        user.signUpInBackground { (success, error) in
            if success{
                self.performSegue(withIdentifier: "EntrySegue", sender: nil)
            }else{
                print("Error Sigining up: \(error?.localizedDescription)")
            }
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
