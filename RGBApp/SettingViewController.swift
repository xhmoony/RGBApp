//
//  ViewController.swift
//  RGBPalette
//
//  Created by Владимир Х. on 31.07.2022.
//

import UIKit


class SettingViewController: UIViewController {

    @IBOutlet var valueForm: UIView!
   
    @IBOutlet var valueRed: UILabel!
    @IBOutlet var valueGreen: UILabel!
    @IBOutlet var valueBlue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var randomButton: UIButton!
    
// MARK: - Public Properties
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
        setValue(for: valueRed, valueGreen, valueBlue)
    }
    
// MARK: - Actions
    @IBAction func sliderMovement(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            valueRed.text = string(from: redSlider)
        case greenSlider:
            valueGreen.text = string(from: greenSlider)
        default:
            valueBlue.text = string(from: blueSlider)
        }
    }
    
    @IBAction func SaveButtonPressed() {
        delegate?.setColor(view.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    
//MARK: - Private Methods
    private func setColor() {
       view.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for values: UILabel...) {
        values.forEach { value in
            switch value {
            case valueRed:
                valueRed.text = string(from: redSlider)
            case valueGreen:
                valueGreen.text = string(from: greenSlider)
            default:
                valueBlue.text = string(from: blueSlider)
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

        valueRed.text = String(format: "%.2f", redSlider.value)
        valueGreen.text = String(format: "%.2f", greenSlider.value)
        valueBlue.text = String(format: "%.2f", blueSlider.value)
    }
}

