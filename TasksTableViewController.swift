//
//  TasksTableViewController.swift
//  todoList
//
//  Created by Luis Esquivel on 2017-02-16.
//  ID 300869199
//  Copyright © 2017 luis. All rights reserved.
//

import UIKit
import os.log
import Firebase
import FirebaseDatabase

class TasksTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var tasks = [Tasks]()
    var tagIndex: Int = 0
    
    
    let ref = FIRDatabase.database().reference()
    /*
    func loadTasks() {
        
        let task1 = Tasks(taskName: "task 1", taskDetail: "detail 1", taskStatus: false)!
        let task2 = Tasks(taskName: "task 2", taskDetail: "detail 2", taskStatus: false)!
        let task3 = Tasks(taskName: "task 3", taskDetail: "detail 3", taskStatus: false)!
        
        tasks += [task1, task2, task3]
        
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        // 1
        ref.observe(.value, with: { snapshot in
            // 2
            var newItems: [Tasks] = []
            
            // 3
            for item in snapshot.children {
                // 4
                let task = Tasks(snapshot: item as! FIRDataSnapshot)
                newItems.append(task)
            }
            
            // 5
            self.tasks = newItems
            self.tableView.reloadData()
        })

        
        
        //loadTasks()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let  cellIdentifier = "todoCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TasksTableViewCell
        
        let task = tasks[indexPath.row]
        
        cell.taskLabelName.text = task.taskName
        cell.editButton2.tag = indexPath.row
        
        cell.taskSwitch2.tag = indexPath.row
        if task.taskStatus {
            // if task is completed then tittle is disabled
            cell.taskSwitch2.isOn = false
            //cell.editButton2.isEnabled = false
            cell.swithChanged(cell.taskSwitch2)
        }
        //print(indexPath.row)
        //cell.editButton.tag = indexPath.row
        


        // Configure the cell...

        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tasks.remove(at: indexPath.row)
            //tableView.deleteRows(at: [indexPath], with: .fade)
            
            let task = tasks[indexPath.row]
            task.ref?.removeValue()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    //MARK: Actions
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? TaskViewController, let task = sourceViewController.task {
            
            //if (sourceViewController.editFlag!) {
                // Update an existing task.
                
                //tasks[selectedIndexPath.row] = task
                //tableView.reloadRows(at: [selectedIndexPath], with: .none)
                //task.ref?.updateChildValues(["taskName" : task.taskName,
                //                            "taskDetail" : task.taskDetail,
                //                             "taskStatus" : task.taskStatus])
          //      sourceViewController.editFlag = false

          //  } else {
                // Add a new task.
                //let newIndexPath = IndexPath(row: tasks.count, section: 0)
                
                
                let taskItemRef = self.ref.child(task.taskName.lowercased())
                taskItemRef.setValue(task.toAnyObject())
                //tasks.append(task)
                //tableView.insertRows(at: [newIndexPath], with: .automatic)
         //   }
            
        }
    }

    
    
    
    @IBAction func editButtonTouched(_ sender: UIButton) {
        tagIndex = sender.tag
    }

    // When switch position change the taks status is updated
    @IBAction func taskSwitchChanged2(_ sender: UISwitch) {
        let task = tasks[sender.tag]
        if sender.isOn {
            task.ref?.updateChildValues(["taskStatus" : false])
        } else {
            task.ref?.updateChildValues(["taskStatus" : true])
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "addTask":
            os_log("Adding a new task.", log: OSLog.default, type: .debug)
            
        case "editTask":
            guard let taskDetailViewController = segue.destination as? TaskViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            let selectedTask = tasks[tagIndex]
            taskDetailViewController.task = selectedTask
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
        
        
    }
    

}
