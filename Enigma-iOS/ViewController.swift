//
//  ViewController.swift
//  Enigma
//
//  Created by Johnny Console on 2024-02-02.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet private weak var rotorPicker: UIPickerView!
    @IBOutlet private var lamps: [UILabel]!
    @IBOutlet private var keys: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rotorPicker.selectRow(1, inComponent: 1, animated: false)
        rotorPicker.selectRow(2, inComponent: 2, animated: false)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch(row) {
            case 0:
                return "I"
            case 1:
                return "II"
            case 2:
                return "III"
            case 3:
                return "IV"
            default:
                return "V"
        }
    }

    @IBAction func onKeyPressed(_ sender: UIButton!) {
        clearLamps()
        let key = sender.titleLabel!.text!
        let lamp = findLamp(key)
        lamp?.textColor = UIColor.systemYellow
    }
    
    private func clearLamps() {
        lamps.forEach { lamp in
            lamp.textColor = UIColor.systemGray2
        }
    }
    
    private func findLamp(_ letter: String) -> UILabel? {
        var theLamp: UILabel?
        lamps.forEach { lamp in
            if lamp.text! == letter {
                     theLamp = lamp
            }
        }
        return theLamp
    }

}

