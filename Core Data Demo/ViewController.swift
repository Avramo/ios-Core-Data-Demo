//
//  ViewController.swift
//  Core Data Demo
//
//  Created by admin on 13/02/2020.
//  Copyright © 2020 AM Kirsch. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("moshe", forKey: "username")
        newUser.setValue("pass", forKey: "password")
        newUser.setValue(33, forKey: "age")
        
        do {
            try context.save()
            print("saved in context")
            
        } catch  {
            print("we have an error")
        }
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey: "username") as? String {
                        print("username: \(username)")
                    }
                    if let password = result.value(forKey: "password") as? String {
                        print("password: \(password)")
                    }
                    if let age = result.value(forKey: "age") as? String {
                        print("age: \(age)")
                    }
                }
            }
            print("here's the results: ")
            print(results)
            
        } catch {
            
            print("error catch!")
        }
        
    }


}

