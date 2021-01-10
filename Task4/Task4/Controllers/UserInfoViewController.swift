//
//  UserInfoViewController.swift
//  Task4
//
//  Created by Admin on 12/23/20.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var user: User!
    private var blackView: UIView!
    
    override func loadView() {
        super.loadView()
        
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(popupAction))
        doneBarButton.tintColor = .red
        navigationItem.rightBarButtonItem = doneBarButton
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        usernameLabel.text = user.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let containerVC = segue.destination as? ChildViewController else { return }
        guard let user = user else { return }
        
        
        switch segue.identifier {
        case "topInfoViewUserInfoViewController":
            let model = UserSubmodel(leftImage: "video-icon",
                                     leftTitle: "Videos",
                                     leftCount: user.videosCount,
                                     rightImage: "heart-icon",
                                     rightTitle: "Hearts",
                                     rightCount: user.heartsCount)
            
            containerVC.userSubmodel = model
            containerVC.setInfo(userSubmodel: model)
            showBigAlert(containerVC)
        case "bottomInfoViewUserInfoViewController":
            let model = UserSubmodel(leftImage: "game-icon",
                                     leftTitle: "Games",
                                     leftCount: user.gamesCount,
                                     rightImage: "win-icon",
                                     rightTitle: "Wins",
                                     rightCount: user.winsCount)
            
            containerVC.userSubmodel = model
            containerVC.setInfo(userSubmodel: model)
            showBigAlert(containerVC)
        default:
            break
        }
    }
    
    @objc private func popupAction(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    	
    private func showBigAlert(_ containerVC: ChildViewController) {
        containerVC.checkStatsButtonTapped = { [weak self] in
            guard let self = self else {
                return
            }
            
            let bigAlertVC = BigAlertView(nibName: "BigAlertView", bundle: nil)
            bigAlertVC.modalPresentationStyle = .overFullScreen
            bigAlertVC.modalTransitionStyle = .crossDissolve
            
            self.present(bigAlertVC, animated: true, completion: nil)
        }
    }
    
}
