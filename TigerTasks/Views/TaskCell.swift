//
//  TaskCell.swift
//  TigerTasks
//
//  Created by Noah Thompson on 11/5/23.
//

import SwiftUI

struct TaskCell: View {
    @ObservedObject var taskcellvm : TaskCellViewModel
    
    var onCommit: (Task) -> (Void) = {_ in}
    
    var body: some View {
        HStack {
           
            Image(systemName: taskcellvm.task.completed ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    self.taskcellvm.task.completed.toggle()
                } 
            TextField("Enter the task title", text: $taskcellvm.task.title, onCommit: {
                self.onCommit(self.taskcellvm.task)
            })
        }
    }
}

