//
//  TaskCellViewModel.swift
//  TigerTasks
//
//  Created by Noah Thompson on 11/5/23.
//

import Foundation
import Combine

class TaskCellViewModel : ObservableObject, Identifiable {
    @Published var taskRepo = TasksRepo()
    
    @Published var task : Task
    
    var id = ""
    @Published var completionstateIconName = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(task: Task) {
        self.task = task
        
        $task
            .map { task in
                task.completed ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.completionstateIconName, on: self)
            .store(in: &cancellables)
        
        $task
            .compactMap { task in
                task.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
        
        $task
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink { task in
                self.taskRepo.updateTask(task)
            }
            .store(in: &cancellables)
    }
    
}
