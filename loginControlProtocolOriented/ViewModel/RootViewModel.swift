//
//  RootViewModel.swift
//  loginControlProtocolOriented
//
//  Created by Ümit Şimşek on 22.08.2023.
//

import Foundation
import UIKit

protocol RootViewModelProtocol : AnyObject {
    func showMain()
    func showLogin()
}

class RootViewModel {
    private let loginStorageService : LoginStorageServiceProtocol
    weak var rootViewModelProtocol : RootViewModelProtocol?
    
    init(loginStorageService: LoginStorageServiceProtocol) {
        self.loginStorageService = loginStorageService
    }
    
    func checkLogin() {
        if let isLoggedIn = loginStorageService.getUserAccessToken(),
           !isLoggedIn.isEmpty {
            //self.showView(MainViewController())
            rootViewModelProtocol?.showMain()
        }else {
            //self.showView(LoginViewController())
            rootViewModelProtocol?.showLogin()

        }
    }
}
