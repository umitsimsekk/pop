//
//  loginControlProtocolOrientedTests.swift
//  loginControlProtocolOrientedTests
//
//  Created by Ümit Şimşek on 22.08.2023.
//

import XCTest
@testable import loginControlProtocolOriented

final class loginControlProtocolOrientedTests: XCTestCase {
    private var viewModel : RootViewModel!
    private var loginStorageServiceProtocol : mockLoginStorageServiceProtocol!
    private var rootViewModelProtocol : mockRootViewModelProtocol!
    
    
    override func setUpWithError() throws {
        loginStorageServiceProtocol = mockLoginStorageServiceProtocol()
        viewModel = RootViewModel(loginStorageService: loginStorageServiceProtocol)
        rootViewModelProtocol = mockRootViewModelProtocol()
        
        viewModel.rootViewModelProtocol = rootViewModelProtocol
    }

    override func tearDownWithError() throws {
    }

    func testShowLogin_whenLoginStorageReturnsEmptyUserAccessToken() throws {
        loginStorageServiceProtocol.storage = [:]
        viewModel.checkLogin()
        
        XCTAssertEqual(rootViewModelProtocol.check.first, .login)
       
    }
    func testShowMain_whenLoginStorageReturnsUserAccessToken() throws {
        loginStorageServiceProtocol.storage["user_signed_in"] = "qwewqewqe"
        viewModel.checkLogin()
        
        XCTAssertEqual(rootViewModelProtocol.check.first, .main)
       
    }
}
class mockLoginStorageServiceProtocol : LoginStorageServiceProtocol {
    var userAccessTokenKey: String {
        return "user_signed_in"
    }
    var storage = [String : String]()
    func setUserAccessToken(token: String) {
        
        storage[userAccessTokenKey] = token
    }
    
    func getUserAccessToken() -> String? {
        return storage[userAccessTokenKey]
    }
    
    
}
class mockRootViewModelProtocol : RootViewModelProtocol {
    enum Check {
        case main
        case login
    }
    var check = [Check]()
    func showMain() {
        check.append(.main)
    }
    
    func showLogin() {
        check.append(.login)
    }
    
    
}
