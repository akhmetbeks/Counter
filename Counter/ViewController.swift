//
//  ViewController.swift
//  Counter
//
//  Created by Sultan Akhmetbek on 01.03.2025.
//
//

import UIKit

class ViewController: UIViewController {
    var value = 0
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    
    @IBAction func onAddPressed() {
        updateValue(on: .add)
    }
    
    @IBAction func onResetPressed() {
        updateValue(on: .reset)
    }
    
    @IBAction func onSubtractPressed() {
        updateValue(on: .subtract)
    }
    
    func updateValue(on type: ButtonEnum) {
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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


}

