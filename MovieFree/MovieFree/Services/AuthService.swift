//
//  AuthService.swift
//  TixAura
//
//  Created by Alex Tran on 29/4/25.
//

import Foundation
import FirebaseAuth
class AuthService {
    
    func createUser(username:String, password:String, completion: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().createUser(withEmail: username, password: password) { (authResult, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let result = authResult {
                completion(.success(String(describing: result))) // Trả về UID của người dùng nếu thành công
            } else {
                let unknownError = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Không thể lấy UID người dùng"])
                completion(.failure(unknownError)) // Lỗi không xác định
            }
        }
    }
    
    func login(username:String, password:String, completion: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().signIn(withEmail: username, password: password) { [weak self] (authResult, error) in
            guard self != nil else { return }
            if let error = error {
                print(error)
            }
            
            print("\(String(describing: authResult))")
        }
    }
}


