//
//  ModallyViewController.swift
//  Nano1
//
//  Created by Hardisty Aliviasari on 08/05/22.
//

import UIKit
// MARK: - Protocol for our own delegate
protocol ModallyViewControllerDelegate: AnyObject {
    // Delegate method that can be used
    func addNewData(data:String)
}

class ModallyViewController: UIViewController {
    
    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var suitabilityTextField: UITextField!
    @IBOutlet weak var shelfTextField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    
    let suitability = ["Holy Grail", "Loving it", "Not for me"]
    let shelfLife = ["3M", "6M", "9M", "12M", "24M"]
    
    var suitabilityPickerView = UIPickerView()
    var shelfLifePickerView = UIPickerView()
    // MARK: - delegate object initialization
    weak var delegate: (ModallyViewControllerDelegate)?
    var productName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        suitabilityTextField.inputView = suitabilityPickerView
        shelfTextField.inputView = shelfLifePickerView
        
        productNameTextField.delegate = self
        
        suitabilityPickerView.delegate = self
        suitabilityPickerView.dataSource = self
        shelfLifePickerView.delegate = self
        shelfLifePickerView.dataSource = self
        
        suitabilityPickerView.tag = 1
        shelfLifePickerView.tag = 2
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        self.delegate?.addNewData(data: productName)
        self.dismiss(animated: true)
    }
    
    
}

extension ModallyViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { switch pickerView.tag {
    case 1:
        return suitability.count
    case 2:
        return shelfLife.count
    default:
        return 1
    }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { switch pickerView.tag {
    case 1:
        return suitability[row]
    case 2:
        return shelfLife[row]
    default:
        return "Data not found."
    }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) { switch pickerView.tag {
    case 1:
        suitabilityTextField.text = suitability[row]
        suitabilityTextField.resignFirstResponder()
    case 2:
        shelfTextField.text = shelfLife[row]
        shelfTextField.resignFirstResponder()
    default:
        return
    }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = productNameTextField.text {
            productName = text
        }
        textField.resignFirstResponder()
        return true
    }
}
