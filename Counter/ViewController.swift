//
//  ViewController.swift
//  Counter
//
//  Created by Сергей Буйнов on 18.10.2026.
//

import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounter()
        addHistoryRecord("история изменений")
        
        minusTap.tintColor = .red
        plusTap.tintColor = .blue
        resetTap.tintColor = .green
    }
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var minusTap: UIButton!
    @IBOutlet private weak var plusTap: UIButton!
    @IBOutlet private weak var resetTap: UIButton!
    @IBOutlet private weak var dateClock: UITextView!
    @IBOutlet private weak var historyTextViev: UITextView!
    private var history: [String] = []
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter
    }()
    
    private var counter = 0
    
    private func addHistoryRecord(_ message: String) {
        let dateString = dateFormatter.string(from: Date())
        history.append("[\(dateString)]: \(message)")
        historyTextViev.text = history.joined(separator: "\n")
    }
    
    private func updateCounter() {
        counterLabel.text = "Значение счетчика: \(counter)"
    }
    
    @IBAction private func minus(_ sender: Any) {
        
        if counter > 0 {
            counter -= 1
            updateCounter()
            addHistoryRecord("Значение изменено на -1")
        } else {
            addHistoryRecord("Попытка уменьшить значение счетчика ниже 0")
        }
    }
    
    @IBAction private func plus(_ sender: Any) {
        counter += 1
        updateCounter()
        addHistoryRecord("Значение изменено на +1")
    }
    
    @IBAction private func reset(_ sender: Any) {
        counter = 0
        updateCounter()
        addHistoryRecord("Значение сброшено")
    }
    
}

