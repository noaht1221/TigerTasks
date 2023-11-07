//
//  TaskListViewModel.swift
//  TigerTasks
//
//  Created by Noah Thompson on 11/5/23.
//

import Foundation
import Combine

class TaskListViewModel : ObservableObject {
    
    @Published var taskRepo = TasksRepo()
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        taskRepo.$tasks
            .map { tasks in
                tasks.map { task in
                    TaskCellViewModel(task: task)
                }
            }
                .assign(to: \.taskCellViewModels, on: self)
                .store(in: &cancellables)
       
    }
    
    func addTask(task: Task) {
        taskRepo.addTask(task)
       // let taskVM = TaskCellViewModel(task: task)
       // self.taskCellViewModels.append(taskVM)
        
    }
    
}
