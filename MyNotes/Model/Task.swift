//
//  Task.swift
//  MyNotes
//
//  Created by ozan on 19.09.2023.
//

import FirebaseFirestore

//Firestore DB den task modeli oluşturuyoruz
struct Task {
    let taskId: String
    let text: String
    let timestamp: Timestamp
    
    init(data: [String: Any]) {
        self.taskId = data["taskId"] as? String ?? ""
        self.text = data["text"] as? String ?? ""
        self.timestamp = data["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
}
