//
//  TasksTableViewCell.swift
//  todoList
//
//  Created by Luis Esquivel on 2017-02-19.
//  ID 300869199
//  Copyright © 2017 luis. All rights reserved.
//

import UIKit

class TasksTableViewCell: UITableViewCell {

    
    // MARK: Properties
    
    @IBOutlet weak var taskLabelName: UILabel!
    @IBOutlet weak var editButton2: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
