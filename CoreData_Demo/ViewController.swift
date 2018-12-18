//
//  ViewController.swift
//  CoreData_Demo
//
//  Created by 周越 on 2018/12/15.
//  Copyright © 2018年 周越. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    let appDeleget = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func add(_ sender: Any) {
        let person = Person(context: context)
        person.name = tfName.text
        person.phone = tfPhone.text
        appDeleget.saveContext()
    }
    
    @IBAction func update(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            p.phone = tfPhone.text!
            appDeleget.saveContext()
        }
    }
    @IBAction func del(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            context.delete(p)
            appDeleget.saveContext()
        }
    }
    
    @IBAction func query(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            tfPhone.text = p.phone
        }
        
    }
    
}

