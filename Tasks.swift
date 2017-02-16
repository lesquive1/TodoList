//
//  Tasks.swift
//  todoList
//
//  Created by Luis Esquivel on 2017-02-16.
//  Copyright © 2017 luis. All rights reserved.
//

import UIKit

class Tasks {
    // MARK: Properties
    
    var taskName: String
    var taskDetail: String
    var taskStatus: Bool
    
    
    // MARK: Initialization
    
    init?(taskName: String,
          taskDetail: String,
          taskStatus: Bool) {
        
        // Initialize stored properties.
        self.taskName = taskName
        self.taskDetail = taskDetail
        self.taskStatus = taskStatus

        // Initialization should fail if there is no task name.
        if taskName.isEmpty {
            
            return nil
            
        }
        
    }
}
