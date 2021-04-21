//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Jin Joo Lee on 4/21/21.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    let task: Task? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TaskController.sharedInstance.loadFromPersistenceStore()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedInstance.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)

        let task = TaskController.sharedInstance.tasks[indexPath.row]
        
        cell.textLabel?.text = task.name

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? TaskDetailViewController else { return }
        destinationVC.task = task
        
        if segue.identifier == "toDetailVC" {
            if let index = tableView.indexPathForSelectedRow {
                let taskToSend = TaskController.sharedInstance.tasks[index.row]
                destinationVC.task = taskToSend
            }
        }
    }
}

