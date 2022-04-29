//
//  ProductTableViewCell.swift
//  Nano1
//
//  Created by Hardisty Aliviasari on 28/04/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell, UITextFieldDelegate {

    static let identifier = "ProductTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ProductTableViewCell", bundle: nil)
    }
    @IBOutlet var field: UITextField!
    
    @IBOutlet weak var suitabilityBtn: UIButton!
    
    @IBOutlet weak var shelfBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        field.placeholder = "Insert Product Name"
        field.delegate = self
        // Initialization code
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("\(textField.text ?? "")")
        return true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
