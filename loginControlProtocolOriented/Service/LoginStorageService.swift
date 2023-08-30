//
//  LoginStorageServiceProtoco.swift
//  loginControlProtocolOriented
//
//  Created by Ümit Şimşek on 22.08.2023.
//

import Foundation

class LoginStorageService : LoginStorageServiceProtocol {
    
    private let storage = UserDefaults.standard
    
    var userAccessTokenKey: String {
        return "user_signed_in"
    }
    
    func setUserAccessToken(token: String) {
        storage.set(token, forKey: userAccessTokenKey)
    }
    
    func getUserAccessToken() -> String? {
        return storage.string(forKey: userAccessTokenKey)
    }
    
    
}
