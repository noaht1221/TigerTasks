//
//  ContentView.swift
//  TigerTasks
//
//  Created by Noah Thompson on 11/5/23.
//

import SwiftUI

struct TasksListView: View {
    var body: some View {
        NavigationStack {
                    List {
                        NavigationLink {
                            TaskView()
                            }
                            label : {
                                Text("Class Tasks")
                            }
                        NavigationLink {
                            TimerView()
                            }
                            label : {
                                Text("Study Break Timer")
                            }
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


