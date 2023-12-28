//
//  ViewController.swift
//  FutCardCreator
//
//  Created by Hüseyin Kaya on 27.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var ratingTextField: UITextField!
    
    
    var currentIndex = 0 // Image index
    var ratingIndex = Array(1...99)
    var pickerView : UIPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingTextField.delegate = self
        pickerView.dataSource = self
        pickerView.delegate = self
        ratingTextField.inputView = pickerView
        
        imageView.image = UIImage(named: Model.imageNames[currentIndex])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tapGesture)
        
    }

    @IBAction func rightButtonTapped(_ sender: UIButton) {
        currentIndex = (currentIndex + 1) % Model.imageNames.count
        imageView.image = UIImage(named: Model.imageNames[currentIndex])
    }
    
    @IBAction func leftButtonTapped(_ sender: UIButton) {
        currentIndex = (currentIndex - 1 + Model.imageNames.count) % Model.imageNames.count
        imageView.image = UIImage(named: Model.imageNames[currentIndex])
    }
    
     @objc func handleTap() {
        view.endEditing(true)
    }
    
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ratingIndex.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(ratingIndex[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let selectedValue = ratingIndex[row]
            ratingTextField.text = "\(selectedValue)"
            checkRating()
        }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == ratingTextField {
            pickerView.isHidden = false
        }
    }
    
    // Should I delete all the IF cards in order to save some work?
    
    func checkRating() { // if the rating less than 65 it will be a bronze card, if that is between 65-74 it will be a silver card, 75 and higher will be gold card
        guard let ratingText  = ratingTextField.text,
              let ratingValue = Int(ratingText) else {
            return //nothing
        }
        
        if ratingValue < 65 {
            imageView.image = UIImage(named: "bronze")
        } else if ratingValue < 75 {
            imageView.image = UIImage(named: "silver")
        } else {
            imageView.image = UIImage(named: "gold")
        }
    }
    
}







