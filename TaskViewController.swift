//
//  TaskViewController.swift
//  todoList
//
//  Created by Luis Esquivel on 2017-02-20.
//  ID 300869199
//  Copyright © 2017 luis. All rights reserved.
//

import UIKit
import os.log

class TaskViewController: UIViewController {
    
    
    //MARK: Properties
    
    @IBOutlet weak var taskNameText: UITextView!
    @IBOutlet weak var taskDetailText: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var task: Tasks?
    var editFlag: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set up views if editing an existing Task.
        if let task = task {
            
            taskNameText.text = task.taskName
            taskDetailText.text = task.taskDetail

        }

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
     

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let taskName = taskNameText.text
        let taskDetail = taskDetailText.text
        let taskStatus = false
        
        // Set the task to be passed to TasksTableViewController after the unwind segue.
        task = Tasks(taskName: taskName!, taskDetail: taskDetail!, taskStatus: taskStatus)
        
    }


}
