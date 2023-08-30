//
//  LoginStorageService.swift
//  loginControlProtocolOriented
//
//  Created by Ümit Şimşek on 22.08.2023.
//

import Foundation

protocol LoginStorageServiceProtocol {
    var userAccessTokenKey : String { get }
    func setUserAccessToken(token : String)
    func getUserAccessToken() -> String?
}
