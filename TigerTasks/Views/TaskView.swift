//
//  TaskView.swift
//  TigerTasks
//
//  Created by Noah Thompson on 11/15/23.
//

import SwiftUI

struct TaskView: View {
    @ObservedObject var tasklistvm = TaskListViewModel()
     

     
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
             }//.background(.orange)
             
                 .navigationTitle("Class Tasks")
             
         }
     }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
