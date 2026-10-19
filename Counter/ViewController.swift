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
    @IBOutlet weak var dateClock: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateCounter()
        addHistoryRecord("история изменений")
        
        minusTap.tintColor = .red
        plusTap.tintColor = .blue
        resetTap.tintColor = .green
    }
    
    func updateCounter() {
        counterLabel.text = "Значение счетчика: \(counter)"
    }

    @IBAction func minus(_ sender: Any) {
      
        if counter > 0 {
            counter -= 1
            updateCounter()
            addHistoryRecord("Значение изменено на -1")}else{addHistoryRecord("Попытка уменьшить значение счетчика ниже 0")}
    }
    
    @IBAction func plus(_ sender: Any) {
        counter += 1
        updateCounter()
        addHistoryRecord("Значение изменено на +1")
    }
    
    @IBAction func reset(_ sender: Any) {
        counter = 0
        updateCounter()
        addHistoryRecord("Значение сброшено")
    }
    
    var counter = 0
    
    @IBOutlet weak var historyTextViev: UITextView!
    var history: [String] = []
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter
    }()
    
    func addHistoryRecord(_ message: String) {
        let dateString = dateFormatter.string(from: Date())
        history.append("[\(dateString)]: \(message)")
        historyTextViev.text = history.joined(separator: "\n")
    }
    
}

