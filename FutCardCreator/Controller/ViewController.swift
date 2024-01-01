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
    @IBOutlet var playerTextField: UITextField!
    @IBOutlet var pacRatingTextField: UITextField!
    @IBOutlet var shoRatingTextField: UITextField!
    @IBOutlet var pasRatingTextField: UITextField!
    @IBOutlet var driRatingTextField: UITextField!
    @IBOutlet var defRatingTextField: UITextField!
    @IBOutlet var phyRatingTextField: UITextField!
    @IBOutlet var flagTextField: UITextField!
    @IBOutlet var playerImageView: UIImageView!
    @IBOutlet var pacLabel: UILabel!
    @IBOutlet var shoLabel: UILabel!
    @IBOutlet var pasLabel: UILabel!
    @IBOutlet var driLabel: UILabel!
    @IBOutlet var defLabel: UILabel!
    @IBOutlet var phyLabel: UILabel!
    
    var currentIndex = 0 // Image index
    var ratingIndex = Array((1...99).reversed())
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
        overrideUserInterfaceStyle = .light
        
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
        
        let imageSelectionGesture = UITapGestureRecognizer(target: self, action: #selector(playerImageViewTapped))
        playerImageView.isUserInteractionEnabled = true
        playerImageView.addGestureRecognizer(imageSelectionGesture)
        
        
    }
    
    @objc func playerImageViewTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func rightButtonTapped(_ sender: UIButton) {
        UIView.transition(with: imageView, duration: 0.5, options: .transitionFlipFromRight, animations: {
            self.currentIndex = (self.currentIndex + 1) % Model.imageNames.count
            self.imageView.image = UIImage(named: Model.imageNames[self.currentIndex])
            self.changeTextColorsForImage(named: "\(Model.imageNames[self.currentIndex])") // Change color of the texts
        }, completion: nil)
        checkRating() //Bug fix
    }
    @IBAction func leftButtonTapped(_ sender: UIButton) {
        UIView.transition(with: imageView, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.currentIndex = (self.currentIndex - 1 + Model.imageNames.count) % Model.imageNames.count
            self.imageView.image = UIImage(named: Model.imageNames[self.currentIndex])
            self.changeTextColorsForImage(named: "\(Model.imageNames[self.currentIndex])") // Change color of the texts
        }, completion: nil)
        checkRating() // Bug fix
    }
    
     @objc func handleTap() {
        view.endEditing(true)
    }
    
    // The thing I'm going to do is change colors according to cards base color. Ex: if the card color is black. The texts must be white
    func changeTextColorsForImage(named imageName: String) {
        switch imageName {
        case "hereos", "potmBundesliga", "potmEpl", "potmEredivisie", "potmLaliga", "potmLigue1", "potmMls", "potmSerieA":
           pickTextColors(textColor: "whiteText")
        case "thunderstruck", "evolution", "totwRed":
           pickTextColors(textColor: "goldText")
        default:
           pickTextColors(textColor: "blackText")
        }
    }
    
    func pickTextColors(textColor: String) {
        ratingTextField.textColor = UIColor(named: textColor)
        positionTextField.textColor = UIColor(named: textColor)
        playerTextField.textColor = UIColor(named: textColor)
        pacRatingTextField.textColor = UIColor(named: textColor)
        shoRatingTextField.textColor = UIColor(named: textColor)
        pasRatingTextField.textColor = UIColor(named: textColor)
        driRatingTextField.textColor = UIColor(named: textColor)
        defRatingTextField.textColor = UIColor(named: textColor)
        phyRatingTextField.textColor = UIColor(named: textColor)
        pacLabel.textColor = UIColor(named: textColor)
        shoLabel.textColor = UIColor(named: textColor)
        pasLabel.textColor = UIColor(named: textColor)
        driLabel.textColor = UIColor(named: textColor)
        defLabel.textColor = UIColor(named: textColor)
        phyLabel.textColor = UIColor(named: textColor)
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
        if ratingValue < 65 && currentIndex == 0 {
            imageView.image = UIImage(named: "bronze")
        } else if ratingValue < 75 && currentIndex == 0 {
            imageView.image = UIImage(named: "silver")
        } else if ratingValue > 74 && currentIndex == 0 {
            imageView.image = UIImage(named: "gold")
        }
    }
    //  When the user switches to cards like icons or heroes and changes the rating, the displayed card was changing again. I prevented this by controlling the currentIndex.
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            playerImageView.image = pickedImage
            playerImageView.contentMode = .scaleAspectFill
            playerImageView.clipsToBounds = true
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}





    // Export button will be created. When it's tapped, all of the labels, texts images will be connected
