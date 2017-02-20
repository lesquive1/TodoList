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

class TasksTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var tasks = [Tasks]()
    var tagIndex: Int = 0
    
    func loadTasks() {
        
        let task1 = Tasks(taskName: "task 1", taskDetail: "detail 1", taskStatus: false)!
        let task2 = Tasks(taskName: "task 2", taskDetail: "detail 2", taskStatus: false)!
        let task3 = Tasks(taskName: "task 3", taskDetail: "detail 3", taskStatus: false)!
        
        tasks += [task1, task2, task3]
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        loadTasks()
        
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

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    @IBAction func editButtonTouched(_ sender: UIButton) {
        tagIndex = sender.tag
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
            /*
            guard let selectedTaskCell = sender as? TasksTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            guard let indexPath = tableView.indexPath(for: selectedTaskCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            */

            
            let selectedTask = tasks[tagIndex]
            taskDetailViewController.task = selectedTask
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
        
        
    }
    

}
