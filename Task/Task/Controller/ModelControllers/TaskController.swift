//
//  TaskController.swift
//  Task
//
//  Created by Jin Joo Lee on 4/21/21.
//

import Foundation

class TaskController {
    
    static let sharedInstance = TaskController()
    
    var tasks: [Task] = []
    
    // MARK: - CRUD
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let newTask = Task(name: name, notes: notes, dueDate: dueDate)
        tasks.append(newTask)
        
        saveToPersistenceStorage()
    }
    
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        
        saveToPersistenceStorage()
    }
    
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        
        saveToPersistenceStorage()
    }
    
    func delete(task: Task) {
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks.remove(at: index)
        
        saveToPersistenceStorage()
    }
    
    // MARK: -Persistence
    func createPersistenceStore() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectoryURL = urls[0].appendingPathComponent("Task.json")
        return documentDirectoryURL
    }
    
    func saveToPersistenceStorage() {
        do {
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: createPersistenceStore())
        } catch {
            print("Error encoding tasks")
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            tasks = try JSONDecoder().decode([Task].self, from: data)
        } catch {
            print("Error in decoding")
        }
    }
}
