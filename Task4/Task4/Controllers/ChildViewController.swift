//
//  ChildViewController.swift
//  Task4
//
//  Created by Admin on 12/23/20.
//

import UIKit

class ChildViewController: UIViewController {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var leftCounterLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var rightCounterLabel: UILabel!
    @IBOutlet weak var checkStatsButton: UIButton!
    
    var userSubmodel: UserSubmodel! {
        didSet {
            setInfo(userSubmodel: userSubmodel)
        }
    }
    
    var checkStatsButtonTapped: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkStatsButton.setTitle("Check Stats", for: .normal)
        setInfo(userSubmodel: userSubmodel)
    }
    
    @IBAction func checkStatsAction(_ sender: UIButton) {
        checkStatsButtonTapped?()
    }
    
    func setInfo(userSubmodel: UserSubmodel?) {
        if let userSubmodel = userSubmodel,
           let leftCounterLabel = leftCounterLabel,
           let rightCounterLabel = rightCounterLabel {
            
            leftImageView.image = UIImage(named: userSubmodel.leftImage)
            leftLabel.text = userSubmodel.leftTitle
            leftCounterLabel.text = String(userSubmodel.leftCount)
            rightImageView.image = UIImage(named: userSubmodel.rightImage)
            rightLabel.text = userSubmodel.rightTitle
            rightCounterLabel.text = String(userSubmodel.rightCount)
        }
    }

}

struct UserSubmodel {
    var leftImage: String
    var leftTitle: String
    var leftCount: Int
    var rightImage: String
    var rightTitle: String
    var rightCount: Int
}
