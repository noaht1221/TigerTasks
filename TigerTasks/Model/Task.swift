//
//  Tasks.swift
//  TigerTasks
//
//  Created by Noah Thompson on 11/5/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task : Codable, Identifiable {
    @DocumentID var id : String?
    var title : String
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp?
    var userId : String?
}

