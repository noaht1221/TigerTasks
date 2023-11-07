//
//  ContentView.swift
//  TigerTasks
//
//  Created by Noah Thompson on 11/5/23.
//

import SwiftUI

struct TasksListView: View {
    
   @ObservedObject var tasklistvm = TaskListViewModel()
    
    let tasks = testDataTasks
    
    @State var presentAddNewItem = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                ForEach(tasklistvm.taskCellViewModels) { taskcellvm  in
                    TaskCell(taskcellvm: taskcellvm)
                  }
                    if presentAddNewItem {
                        TaskCell(taskcellvm: TaskCellViewModel(task: Task(title: "", completed: false))) { task in
                            self.tasklistvm.addTask(task: task)
                            self.presentAddNewItem.toggle()
                        }
                    }
                }
                Button(action: {self.presentAddNewItem.toggle()}) {
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add New Task")
                        
                    }
                }
                .padding()
            }
            .navigationTitle("Tiger Tasks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TasksListView()
    }
}


