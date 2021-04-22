//
//  TaskTableViewCell.swift
//  Task
//
//  Created by Jin Joo Lee on 4/21/21.
//

import UIKit

protocol taskCompletionDelegate: class {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    weak var delegate: taskCompletionDelegate?
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    @IBAction func completeButtonTapped(_ sender: Any) {
        if let delegate = delegate {
            delegate.taskCellButtonTapped(self)
        }
    }
    
    func updateViews() {
        guard let task = task else { return }
        taskNameLabel.text = task.name
        
        if task.isComplete {
            completeButton.setBackgroundImage(UIImage(named: "incomplete"), for: UIControl.State.normal)
        } else {
            completeButton.setBackgroundImage(UIImage(named: "complete"), for: UIControl.State.normal)
        }
    }
    
}
