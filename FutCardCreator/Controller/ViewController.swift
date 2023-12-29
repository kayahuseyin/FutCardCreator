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
    @IBOutlet var positionTextField: UITextField!
    @IBOutlet var pacRatingTextField: UITextField!
    @IBOutlet var shoRatingTextField: UITextField!
    @IBOutlet var pasRatingTextField: UITextField!
    @IBOutlet var driRatingTextField: UITextField!
    @IBOutlet var defRatingTextField: UITextField!
    @IBOutlet var phyRatingTextField: UITextField!
    @IBOutlet var flagTextField: UITextField!
    
    var currentIndex = 0 // Image index
    var ratingIndex = Array(1...99)
    let countryFlagKeys = Array(Model.countryFlags.keys.sorted())
    var ratingPickerView : UIPickerView = UIPickerView()
    var positionPickerView: UIPickerView = UIPickerView()
    var pacPickerView: UIPickerView = UIPickerView()
    var shoPickerView: UIPickerView = UIPickerView()
    var pasPickerView: UIPickerView = UIPickerView()
    var driPickerView: UIPickerView = UIPickerView()
    var defPickerView: UIPickerView = UIPickerView()
    var phyPickerView: UIPickerView = UIPickerView()
    var flagPickerView: UIPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        positionTextField.delegate = self
        ratingTextField.delegate = self
        
       
        pacPickerView.dataSource = self
        shoPickerView.dataSource = self
        pasPickerView.dataSource = self
        driPickerView.dataSource = self
        defPickerView.dataSource = self
        phyPickerView.dataSource = self
        pacPickerView.delegate = self
        shoPickerView.delegate = self
        pasPickerView.delegate = self
        driPickerView.delegate = self
        defPickerView.delegate = self
        phyPickerView.delegate = self
        flagPickerView.delegate = self
        flagPickerView.dataSource = self
        
        ratingPickerView.dataSource = self
        ratingPickerView.delegate = self
        positionPickerView.delegate = self
        positionPickerView.dataSource = self
        
        ratingTextField.inputView = ratingPickerView
        positionTextField.inputView = positionPickerView
        pacRatingTextField.inputView = pacPickerView
        shoRatingTextField.inputView = shoPickerView
        pasRatingTextField.inputView = pasPickerView
        driRatingTextField.inputView = driPickerView
        defRatingTextField.inputView = defPickerView
        phyRatingTextField.inputView = phyPickerView
        flagTextField.inputView = flagPickerView
        
        
        imageView.image = UIImage(named: Model.imageNames[currentIndex])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tapGesture)
        
        
    }

    @IBAction func rightButtonTapped(_ sender: UIButton) {
        UIView.transition(with: imageView, duration: 0.5, options: .transitionFlipFromRight, animations: {
            self.currentIndex = (self.currentIndex + 1) % Model.imageNames.count
            self.imageView.image = UIImage(named: Model.imageNames[self.currentIndex])
        }, completion: nil)
    }
    @IBAction func leftButtonTapped(_ sender: UIButton) {
        UIView.transition(with: imageView, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.currentIndex = (self.currentIndex - 1 + Model.imageNames.count) % Model.imageNames.count
            self.imageView.image = UIImage(named: Model.imageNames[self.currentIndex])
        }, completion: nil)
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
        
        if pickerView == positionPickerView {
            return Model.positionNames.count
        } else if pickerView == flagPickerView {
            return Model.countryFlags.count
        } else {
            return ratingIndex.count
        }
    
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == positionPickerView {
            return Model.positionNames[row]
        } else if pickerView == flagPickerView {
            return countryFlagKeys[row]
        } else {
            return "\(ratingIndex[row])"
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 🤢🤢🤢🤢🤢🤢🤢🤢🤢🤢🤢🤢🤢🤢🤢🤢🤢🤢🤢
        // After I saw GTA 5 source codes, I have no shame
        
        if pickerView == ratingTextField.inputView {
            let selectedValue = ratingIndex[row]
            ratingTextField.text = "\(selectedValue)"
            checkRating()
        } else if pickerView == positionTextField.inputView {
            let selectedPosition = Model.positionNames[row]
            positionTextField.text = "\(selectedPosition)"
        } else if  pickerView == pacRatingTextField.inputView {
            let selectedValue = ratingIndex[row]
            pacRatingTextField.text = "\(selectedValue)"
        } else if pickerView == shoRatingTextField.inputView {
            let selectedValue = ratingIndex[row]
            shoRatingTextField.text = "\(selectedValue)"
        } else if pickerView == pasRatingTextField.inputView {
            let selectedValue = ratingIndex[row]
            pasRatingTextField.text = "\(selectedValue)"
        } else if pickerView == driRatingTextField.inputView {
            let selectedValue = ratingIndex[row]
            driRatingTextField.text = "\(selectedValue)"
        } else if pickerView == defRatingTextField.inputView {
            let selectedValue = ratingIndex[row]
            defRatingTextField.text = "\(selectedValue)"
        } else if pickerView == phyRatingTextField.inputView{
            let selectedValue = ratingIndex[row]
            phyRatingTextField.text = "\(selectedValue)"
        } else {
            let selectedKey = countryFlagKeys[row]
            let selectedCountry = Model.countryFlags[selectedKey] ?? ""
            flagTextField.text = "\(selectedCountry)"
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            if textField == ratingTextField {
                ratingTextField.inputView = ratingPickerView
            } else if textField == positionTextField {
                positionTextField.inputView = positionPickerView
            }
        }
        
    }
    
    
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







