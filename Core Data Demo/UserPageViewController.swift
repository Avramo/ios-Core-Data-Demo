//
//  UserPageViewController.swift
//  Core Data Demo
//
//  Created by admin on 13/02/2020.
//  Copyright © 2020 AM Kirsch. All rights reserved.
//

import UIKit

class UserPageViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    
    
    @IBAction func logout(_ sender: Any) {
       currentUser.removeAll()
       print(currentUser)
       print(currentUser.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome back \(currentUser[0]["username"]!) !"
        usernameLabel.text = currentUser[0]["username"]!
        passwordLabel.text = currentUser[0]["password"]!
        ageLabel.text = currentUser[0]["age"]!

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
