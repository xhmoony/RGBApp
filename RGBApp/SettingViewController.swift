//
//  ViewController.swift
//  RGBPalette
//
//  Created by Владимир Х. on 31.07.2022.
//

import UIKit


class SettingViewController: UIViewController {

    @IBOutlet var valueForm: UIView!
   
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var randomButton: UIButton!
    
// MARK: - Properties
    var delegate: SettingViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueForm.alpha = 0.5
        valueForm.layer.cornerRadius = 15
        

        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue

        setColor()
        setSliders()
        setValue(for: redTextField, greenTextField, blueTextField)
    }
    
// MARK: - Actions
    @IBAction func sliderMovement(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redTextField.text = string(from: redSlider)
        case greenSlider:
            greenTextField.text = string(from: greenSlider)
        default:
            blueTextField.text = string(from: blueSlider)
        }
        setColor()
    }
    
    @IBAction func SaveButtonPressed() {
        delegate?.setColor(view.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    

//MARK: - PrivateMethods
    private func setColor() {
       view.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for values: UITextField...) {
        values.forEach { value in
            switch value {
            case redTextField:
                redTextField.text = string(from: redSlider)
            case greenTextField:
                greenTextField.text = string(from: greenSlider)
            default:
                blueTextField.text = string(from: blueSlider)
            }
        }
    }
    
    private func setSliders() {
        let color = CIColor(color: view.backgroundColor!)
        
        redSlider.value = Float(color.red)
        greenSlider.value = Float(color.green)
        blueSlider.value = Float(color.blue)
    }
    
    private func string(from sliderMovement: UISlider) -> String {
        String(format: "%.2f", sliderMovement.value)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @objc private func didTapSave() {
        view.endEditing(true)
    }
    
    
// MARK: - Random Action
    
    private func setRandomColor() {
        view.backgroundColor = UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1
            )
    }

    @IBAction func randomAction() {
        setRandomColor()

        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)

        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
    }
}

//MARK: - Keyboard
    extension SettingViewController: UITextFieldDelegate {
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }
        
        func finishEditing(_ textField: UITextField) {
            guard let text = textField.text else { return }
            
            if let currentValue = Float(text) {
                switch textField {
                case redTextField:
                    redSlider.setValue(currentValue, animated: true)
                case greenTextField:
                    greenSlider.setValue(currentValue, animated: true)
                default:
                    blueSlider.setValue(currentValue, animated: true)
                }
                setColor()
                return
            }
           showAlert(title: "Wrong format!", message: "Please enter correct value")
        }

        func startEditing(_ testField: UITextField) {
            let keyboardToolBar = UIToolbar()
            keyboardToolBar.sizeToFit()
            testField.inputAccessoryView = keyboardToolBar
            
            let saveButton = UIBarButtonItem(
                barButtonSystemItem: .done,
                target: self,
                action: #selector(didTapSave)
            )
            
            let flexBarButton = UIBarButtonItem(
                barButtonSystemItem: .flexibleSpace,
                target: nil,
                action: nil
            )
            
            keyboardToolBar.items = [flexBarButton, saveButton]
    }
}
        
        

