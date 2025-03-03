//
//  ViewController.swift
//  Counter
//
//  Created by Sultan Akhmetbek on 01.03.2025.
//
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var valueLabel: UILabel!
    @IBOutlet weak private var historyTextView: UITextView!
    @IBOutlet weak private var addButton: UIButton!
    @IBOutlet weak private var resetButton: UIButton!
    @IBOutlet weak private var subtractButton: UIButton!
    
    private var value = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueLabel.text = "0"
        valueLabel.font = .boldSystemFont(ofSize: 20)
        
        historyTextView.text = "История изменений:"
        historyTextView.font = .systemFont(ofSize: 16)
        historyTextView.isScrollEnabled = true
        historyTextView.isEditable = false
        
        addButton.tintColor = .systemRed
        addButton.setTitle("+", for: .normal)
        addButton.titleLabel?.font = .boldSystemFont(ofSize: 32)
        
        subtractButton.tintColor = .systemBlue
        subtractButton.setTitle("-", for: .normal)
        subtractButton.titleLabel?.font = .boldSystemFont(ofSize: 32)
        
        resetButton.tintColor = .systemGray
        resetButton.setTitle("0", for: .normal)
        resetButton.titleLabel?.font = .boldSystemFont(ofSize: 32)
    }
    
    private func updateValue(on type: ButtonEnum) {
        let date = Date().formatted()
        var labelText: String = ""
        var historyText: String = ""
        
        switch type {
            case .add:
                value += 1
                labelText = "Значение счётчика: \(value)"
                historyText = "\n\(date): значение изменено на \(value)"
            case .subtract:
                if (value == 0){
                    labelText = "\(value)"
                    historyText = "\n\(date): попытка уменьшить значение счётчика ниже 0"
                } else {
                    value -= 1
                    labelText = "Значение счётчика: \(value)"
                    historyText = "\n\(date): значение изменено на \(value)"
                }
            case .reset:
                value = 0
                labelText = "\(value)"
                historyText = "\n\(date): значение сброшено"
        }
        
        valueLabel.text = labelText
        historyTextView.text += historyText
    }
    
    @IBAction private func onAddPressed() {
        updateValue(on: .add)
    }
    
    @IBAction private func onResetPressed() {
        updateValue(on: .reset)
    }
    
    @IBAction private func onSubtractPressed() {
        updateValue(on: .subtract)
    }
}

