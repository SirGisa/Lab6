//
//  ViewController.swift
//  project1
//
//  Created by georg on 28.04.25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundSwitch.isOn = false
        switchIndicator.textColor = UIColor.white
        switchIndicator.text = "Background image: bg2.jpg"
        if let backgroundImage = UIImage(named: "bg2") {
            view.backgroundColor = UIColor(patternImage: backgroundImage)
        } else {
            print("Изображение 'bg2.jpg' не найдено!")
        }
    }

    @IBOutlet weak var switchIndicator: UILabel!
    @IBOutlet weak var backgroundSwitch: UISwitch!
    
    @IBAction func backgroundSwitchTapped(_ sender: Any) {
        if backgroundSwitch.isOn {
                switchIndicator.text = "Background image: bg1.jpg"
                view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!)
            } else {
                switchIndicator.text = "Background image: bg2.jpg"
                view.backgroundColor = UIColor(patternImage: UIImage(named: "bg2")!)
            }
    }
}

