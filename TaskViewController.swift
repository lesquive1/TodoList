//
//  TaskViewController.swift
//  todoList
//
//  Created by Luis Esquivel on 2017-02-20.
//  ID 300869199
//  Copyright © 2017 luis. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {
    
    
    //MARK: Properties
    
    @IBOutlet weak var taskNameText: UITextView!
    
    var task: Tasks?

    override func viewDidLoad() {
        super.viewDidLoad()

        taskNameText.text = task?.taskName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
     
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The TaskViewController is not inside a navigation controller.")
        }
    }
     
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
