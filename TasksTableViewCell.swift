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
    @IBOutlet weak var taskSwitch2: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func swithChanged(_ sender: UISwitch) {
        
        if (sender.isOn) {
            taskLabelName.textColor = UIColor.black
            taskLabelName.font = UIFont.boldSystemFont(ofSize: 20)
        } else {
            taskLabelName.textColor = UIColor.lightGray
            taskLabelName.font = UIFont.italicSystemFont(ofSize: 15)
        }
    }
}
