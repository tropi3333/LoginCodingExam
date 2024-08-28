//
//  ViewController.swift
//  CodingExamSevenSeven
//
//  Created by Jomar Calandria on 8/28/24.
//

import UIKit
import SVProgressHUD

class LoginVC: UIViewController {
    
    var activityView: UIActivityIndicatorView?
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!

    private var loginViewModel = LoginViewModel(loginService: LoginService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel.delegate = self
    }
    
    @IBAction func didTapSubmitButton(_ sender: Any) {
        SVProgressHUD.show()
        let request = LoginRequest(userEmail: txtUsername.text, userPassword: txtPassword.text)
        loginViewModel.loginUser(loginRequest: request)
    }
}

extension LoginVC: LoginViewModelDelegate {
    
    func didReceiveLoginResponse(loginResponse: LoginResponse?) {
        SVProgressHUD.dismiss(withDelay: 2) {
            if loginResponse?.errorMessage == nil && loginResponse?.data != nil {
                self.showMainScreen()
            }
            else if loginResponse?.errorMessage != nil {
                let alert = UIAlertController(title: "Error", message: loginResponse?.errorMessage, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
    
    func showMainScreen() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "welcomeVC_sbid") as! WelcomeVC
        vc.userName = txtUsername.text
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
          self.present(vc, animated: true, completion: nil)
        
    }
}
