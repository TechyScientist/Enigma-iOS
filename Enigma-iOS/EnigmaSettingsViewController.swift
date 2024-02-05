import UIKit

class EnigmaSettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet private weak var rotors: UIPickerView!
    @IBOutlet private weak var rings: UIPickerView!
    @IBOutlet private weak var reflector: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rotors.selectRow(1, inComponent: 1, animated: false)
        rotors.selectRow(2, inComponent: 2, animated: false)
    }
    
    @IBAction func cancel() {
        let controller = UIAlertController(title: "Are you sure?",
                                           message: "Are you sire you want to exit? Your settings will not be saved.",
                                           preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "No", style: .cancel))
        controller.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in self.dismiss(animated: true) }))
        present(controller, animated: true)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == rotors || pickerView == rings {
            return 3
        }
        else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == rings {
            return 26
        }
        else if pickerView == rotors {
            return 5
        }
        else {
            return 3
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == rotors {
            switch(row) {
                case 0: return "I"
                case 1: return "II"
                case 2: return "III"
                case 3: return "IV"
                default: return "V"
            }
        }
        else {
            return String(Character(UnicodeScalar(row + Int(("A" as UnicodeScalar).value))!))
        }
    }

}
