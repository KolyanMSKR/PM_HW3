//
//  BigAlertView.swift
//  Task4
//
//  Created by Admin on 12/24/20.
//

import UIKit

class BigAlertView: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func okAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
