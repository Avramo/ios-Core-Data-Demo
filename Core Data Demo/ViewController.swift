//
//  ViewController.swift
//  Core Data Demo
//
//  Created by admin on 13/02/2020.
//  Copyright © 2020 AM Kirsch. All rights reserved.
//

import UIKit
import CoreData

var currentUser:[Dictionary<String, String>] = []

var canLogin = false

class ViewController: UIViewController {
  
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func login(_ sender: Any) {
        canLogin = tryToLogin()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loginSegue"{
            if canLogin {
                print("yep! can login")
                return true
            }
        }
        print("nope! can't login")
        return false
    }
    
    func tryToLogin() -> Bool {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        
        if let inputname = usernameTextField.text{
            if inputname != "" && inputname != " "{
                
                if let inputPswrd = passwordTextfield.text{
                    if inputPswrd != "" && inputPswrd != " "{
        
                        do {
                            // narrows down request
                            request.predicate = NSPredicate(format: "username = %@" , inputname)

                            let results = try context.fetch(request)
                            
                            print("here's the results: ")
                            print(results)
                
                            if results.count > 0 {
                                for result in results as! [NSManagedObject] {
                                    // loop until login credentials found then check them
                                    if let username = result.value(forKey: "username") as? String {
                                        if let password = result.value(forKey: "password") as? String {
                                            
                                            if username == inputname && password == inputPswrd{
                                                let age = result.value(forKey: "age") as? Int16 ?? 000
                                                currentUser.append([ "username":username, "password":password, "age":String(age) ] )
                                                print(username, "logged in!")
                                                print(currentUser[0]["username"]!)
                                                print(currentUser)
                                                print(currentUser.count)
                                                return true
                                            }
                                        }
                                        
                                    }
                                    
                                }
                            }
                        } catch {
                            print("error catch!")
                        }
                    }
                }
            }
        }
        // wrong login info or some other problem
            return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }


}

