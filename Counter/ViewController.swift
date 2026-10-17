//
//  ViewController.swift
//  Counter
//
//  Created by Сергей Буйнов on 18.10.2026.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var minusTap: UIButton!
    @IBOutlet weak var plusTap: UIButton!
    @IBOutlet weak var resetTap: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateCounter()
        
        minusTap.tintColor = .red
        plusTap.tintColor = .blue
        resetTap.tintColor = .green
    }
    
    func updateCounter() {
        counterLabel.text = "Значение счетчика: \(counter)"
    }

    @IBAction func minus(_ sender: Any) {
        counter -= 1
        if counter < 0 {
            counter = 0
        }
        updateCounter()
    }
    
    @IBAction func plus(_ sender: Any) {
        counter += 1
        updateCounter()
    }
    
    @IBAction func reset(_ sender: Any) {
        counter = 0
        updateCounter()
    }
    
    var counter = 0
}

