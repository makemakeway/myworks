//
//  UserViewModel.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/10.
//

import SwiftUI
import Firebase

class UserViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapShot, _ in
            guard let documents = snapShot?.documents else { return }
            
            self.users = documents.map({ User(dictionary: $0.data()) })
            
//            documents.forEach { document in
//                let user = User(dictionary: document.data())
//                self.users.append(user)
//            }
        }
    }
}
