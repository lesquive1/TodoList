//
//  Tasks.swift
//  todoList
//
//  Created by Luis Esquivel on 2017-02-16.
//  ID 300869199
//  Copyright © 2017 luis. All rights reserved.
//

import UIKit
import Firebase

class Tasks {
    // MARK: Properties
    
    var taskName: String
    var taskDetail: String
    var taskStatus: Bool
    
    let key: String
    let ref: FIRDatabaseReference?
    
    
    // MARK: Initialization
    
    init?(taskName: String,
          taskDetail: String,
          taskStatus: Bool, key: String = "") {
        
        // Initialize stored properties.
        self.key = key
        self.taskName = taskName
        self.taskDetail = taskDetail
        self.taskStatus = taskStatus
        self.ref = nil

        // Initialization should fail if there is no task name.
        if taskName.isEmpty {
            
            return nil
            
        }
        
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        taskName = snapshotValue["taskName"] as! String
        taskDetail = snapshotValue["taskDetail"] as! String
        taskStatus = snapshotValue["taskStatus"] as! Bool
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "taskName": taskName,
            "taskDetail": taskDetail,
            "taskStatus": taskStatus
        ]
    }
    
}
