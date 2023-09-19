//
//  Service.swift
//  MyNotes
//
//  Created by ozan on 13.09.2023.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

struct Service {
    
    
    static func sendTask(text: String, completion: @escaping(Error?)-> Void){
        
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let taskId = NSUUID().uuidString
        let data = [
            "text": text,
            "timestamp": Timestamp(date: Date()),
            "taskId": taskId
        ] as [String: Any]
        COLLECTION_TASKS.document(currentUid).collection("ongoing_tasks").document(taskId).setData(data, completion: completion)
        
    }

   // User bilgilerini db den getirme
    static func fetchUser(uid: String, completion: @escaping(User) -> Void){
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let data = snapshot?.data() else { return }
            let user = User(data: data)
            completion(user)
        }
        
        
}
    // Oluşturduğumuz taskların listede gözükmesini sağlayan sewrvis
    static func fetchTasks(uid: String , completion: @escaping([Task])->Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var tasks = [Task]()
        COLLECTION_TASKS.document(uid).collection("ongoing_tasks").order(by: "timestamp").addSnapshotListener { snapshot, error in
            snapshot?.documentChanges.forEach({ value in
                if value.type == .added {
                    let data = value.document.data()
                    tasks.append(Task(data: data))
                    completion(tasks)
                }
            })
        }
    }
    
    //taskların silinmesi
    static func deleteTask(task: Task){
        guard let uid = Auth.auth().currentUser?.uid else { return } // şu an açtığımız uid'i alabiliriz
        let data = [
            "text": task.text,
            "taskId": task.taskId,
            "timesstamp": Timestamp(date: Date())
        ] as [String: Any]
        
        COLLECTION_TASKS.document(uid).collection("completed_tasks").document(task.taskId).setData(data) { error in
            if let error = error{
                print("Error: \(error.localizedDescription)")
                return
            }
            COLLECTION_TASKS.document(uid).collection("ongoing_tasks").document(task.taskId).delete()
        }
        
    }
    
    
    
    
}
