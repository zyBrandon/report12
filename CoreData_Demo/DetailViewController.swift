//
//  DetailViewController.swift
//  CoreData_Demo
//
//  Created by 周越 on 2018/12/16.
//  Copyright © 2018年 周越. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var person:Person?
    
    
    @IBOutlet weak var name_label: UILabel!
    @IBOutlet weak var phone_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        name_label.text = person?.name
        phone_label.text = person?.phone
        
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
