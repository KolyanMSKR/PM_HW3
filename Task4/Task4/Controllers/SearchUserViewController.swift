//
//  ViewController.swift
//  Task4
//
//  Created by Admin on 12/23/20.
//

import UIKit

class SearchUserViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func detailsAction(_ sender: UIButton) {
        guard let username = usernameTextField.text else { return }
        
        if usernameTextField.text == "" {
            let alertController = UIAlertController(title: "Enter username!", message: "Tap OK and input an username", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(alertAction)
            present(alertController, animated: true)
            
            return
        }
        
        let user = User(name: username)
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let userInfoVC = storyBoard.instantiateViewController(withIdentifier: "UserInfoViewController") as! UserInfoViewController
        userInfoVC.user = user
        
        let navController = UINavigationController(rootViewController: userInfoVC)
        navController.modalPresentationStyle = .automatic
        present(navController, animated: true)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
}

