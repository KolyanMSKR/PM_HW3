//
//  ViewController.swift
//  Task2
//
//  Created by Admin on 12/23/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var figure1: UIView!
    @IBOutlet weak var figure2: UIView!
    @IBOutlet weak var figure3: UIView!
    @IBOutlet weak var figure4: UIView!
    @IBOutlet weak var figure5: UIView!
    @IBOutlet weak var figure6: UIView!
    @IBOutlet weak var figure7: UIView!
    

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animation1()
        animation2()
        animation3()
        animation4()
    }
    
    override func viewDidLayoutSubviews() {
        figure3.layer.cornerRadius = figure3.frame.size.width / 2
        figure5.layer.cornerRadius = figure5.frame.size.width / 2
        figure6.layer.cornerRadius = figure6.frame.size.width / 2
    }
    
    private func animation1() {
        UIView.animate(withDuration: 1.5, delay: 1.5, options: [.repeat]) {
            self.figure1.transform = self.figure1.transform.scaledBy(x: 2, y: 2)
        }
    }
    
    private func animation2() {
        UIView.animate(withDuration: 1.5, delay: 2.0) {
            self.figure2.backgroundColor = .red
            self.figure3.backgroundColor = .green
        } completion: { (_) in
            UIView.animate(withDuration: 1.5) {
                self.figure2.backgroundColor = .yellow
                self.figure3.backgroundColor = .blue
            } completion: { (_) in
                UIView.animate(withDuration: 1.5) {
                    self.figure2.backgroundColor = .gray
                    self.figure3.backgroundColor = .cyan
                } completion: { (_) in }
            }
        }
    }
    
    private func animation3() {
        UIView.animate(withDuration: 1.5, delay: 2, options: [.repeat, .autoreverse]) {
            self.figure4.layer.cornerRadius = self.figure4.frame.size.width / 2
        }
    }
    
    private func animation4() {
        UIView.animate(withDuration:2.0, delay: 0.3, options: [.autoreverse]) {
            self.figure7.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
    }
    
}

