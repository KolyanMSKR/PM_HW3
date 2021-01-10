//
//  ViewController.swift
//  Task3
//
//  Created by Admin on 12/23/20.
//

import UIKit

class ViewController: UIViewController {

    private let colors: [UIColor] = [.yellow, .orange, .red, .blue, .green, .systemIndigo]
    
    private let circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 20
        return view
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        createGestures()
    }
    
    //MARK: - Private methods
    @objc private func swipeGesture(sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 1.5) {
            if let color = self.colors.randomElement() {
                self.circleView.backgroundColor = color
            }
            
            switch sender.direction {
            case .left:
                self.circleView.center.x = self.circleView.center.x - 30
            case .right:
                self.circleView.center.x = self.circleView.center.x + 30
            case .down:
                self.circleView.center.y = self.circleView.center.y + 30
            case .up:
                self.circleView.center.y = self.circleView.center.y - 30
            default:
                print("Hello, Xcode! I handled all cases!!!")
            }
        }
    }
    
    @objc private func tapAction() {
        UIView.animate(withDuration: 1.5) {
            self.circleView.frame.origin = self.view.center
        }
    }
    
    @objc private func doubleTapAction() {
        UIView.animate(withDuration: 1.5) {
            self.circleView.center = CGPoint(x: self.view.center.x + 80, y: self.view.center.y)
        } completion: { _ in
            UIView.animate(withDuration: 1.5) {
                let circlePath = UIBezierPath(arcCenter: self.view.center, radius: 80, startAngle: 0, endAngle: .pi * 2, clockwise: false)
                let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
                animation.duration = 3
                animation.repeatCount = 1
                animation.path = circlePath.cgPath
                self.circleView.layer.add(animation, forKey: nil)
            }
        }
    }
    
    private func moveTo(point: CGPoint) {
        UIView.animate(withDuration: 1.5) {
            if let color = self.colors.randomElement() {
                self.circleView.backgroundColor = color
            }
            self.circleView.center = point
        }
    }
    
    private func setupUI() {
        view.addSubview(circleView)
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circleView.heightAnchor.constraint(equalToConstant: 40),
            circleView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func createGestures() {
        let directions: [UISwipeGestureRecognizer.Direction] = [.down, .left, .right, .up]
        
        for direction in directions {
            let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
            swipeGesture.direction = direction
            circleView.addGestureRecognizer(swipeGesture)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        tapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGesture)
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTapGesture.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTapGesture)
        
        tapGesture.require(toFail: doubleTapGesture)
    }

}

