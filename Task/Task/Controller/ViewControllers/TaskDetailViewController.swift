//
//  TaskDetailViewController.swift
//  Task
//
//  Created by Jin Joo Lee on 4/21/21.
//

import UIKit

class TaskDetailViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextVie: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    var task: Task?
    var date: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text, !name.isEmpty,
              let notes = taskNotesTextVie.text, !notes.isEmpty,
              let dueDate = taskDueDatePicker?.date else { return }
        
        if let task = task {
            TaskController.sharedInstance.update(task: task, name: name, notes: notes, dueDate: dueDate)
        } else {
            TaskController.sharedInstance.createTaskWith(name: name, notes: notes, dueDate: dueDate)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        date = taskDueDatePicker.date
    }
    
    func updateViews() {
        guard let task = task else { return }
        taskNameTextField.text = task.name
        taskNotesTextVie.text = task.notes
        //taskDueDatePicker.date = task.dueDate
    }
}
