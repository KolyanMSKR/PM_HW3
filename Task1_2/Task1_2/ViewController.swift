//
//  ViewController.swift
//  Task1_2
//
//  Created by Admin on 12/24/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstStackView: UIStackView!
    @IBOutlet weak var secondStackView: UIStackView!
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        guard UIDevice.current.userInterfaceIdiom == .pad else { return }
        
        switch UIDevice.current.orientation {
        case .portrait, .portraitUpsideDown:
            firstStackView.axis = .vertical
            secondStackView.axis = .vertical
        default:
            firstStackView.axis = .horizontal
            secondStackView.axis = .horizontal
        }
    }

}

