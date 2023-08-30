//
//  ViewController.swift
//  loginControlProtocolOriented
//
//  Created by Ümit Şimşek on 22.08.2023.
//

import UIKit



class RootViewController: UIViewController, RootViewModelProtocol {
  
    private let viewModel : RootViewModel
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super .init(nibName: nil, bundle: nil)
        self.viewModel.rootViewModelProtocol = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        viewModel.checkLogin()
    }
    
    func showMain() {
        let vc = MainViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true)
    }
    
    func showLogin() {
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true)
    }
 
}

