//
//  LoginViewController.swift
//  My CoreData Practice
//
//  Created by COE-008 on 23/01/20.
//  Copyright © 2020 COE-008. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var EMAILID: UITextField!
     @IBOutlet weak var PASSWORD: UITextField!
    
 
    @IBAction func LOGIN(_ sender: Any) {
        
        let UEmail = EMAILID.text!
        let UPass = PASSWORD.text!
        
        if (UEmail == "" || UPass == "")
        {
            print("Opps...Not Saved...!")
            let alert = UIAlertController(title: "Don't Worry", message: "Please enter EmailID and Password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let managecontext = appdelegate.persistentContainer.viewContext
            let req = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            req.predicate = NSPredicate(format: "emailid = %@", UEmail)
            
            req.returnsObjectsAsFaults = false
            
            do {
                let result = try managecontext.fetch(req)
                
                for data in result as! [NSManagedObject] {
                    let passwordFromData = data.value(forKey: "password") as! String
                    if UPass == passwordFromData
                    {
                        print("Success to Log in")
                        let alert = UIAlertController(title: "Log in Succesfully", message: "Username : '\(EMAILID.text!)'\nPassword : '\(PASSWORD.text!)'", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            self.dismiss(animated: true, completion: nil)
                            self.EMAILID.text = ""
                            self.PASSWORD.text = ""
                        }
                        alert.addAction(okAction)
                        self.present(alert, animated: true, completion: nil)
                        
                    }
                }
            } catch let err as NSError {
                print("Could not, \(err), \(err.localizedDescription)")
            }
            
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
