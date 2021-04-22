//
//  TaskTableViewCell.swift
//  Task
//
//  Created by Jin Joo Lee on 4/21/21.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let task = task else { return }
        taskNameLabel.text = task.name
        
        if task.isComplete {
            let incompleteButtonImage = UIImage(named: "incomplete")
            completeButton.setBackgroundImage(incompleteButtonImage, for: UIControl.State.normal)
        } else {
            let completeButtonImage = UIImage(named: "complete")
            completeButton.setBackgroundImage(completeButtonImage, for: UIControl.State.normal)
        }
    }
    
    @IBAction func completeButtonTapped(_ sender: Any) {
        
    }
}
