//
//  ViewController.swift
//  RGBPalette
//
//  Created by Владимир Х. on 31.07.2022.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var valueForm: UIView!
   
    @IBOutlet var valueRed: UILabel!
    @IBOutlet var valueGreen: UILabel!
    @IBOutlet var valueBlue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueForm.alpha = 0.3
        
        redSlider.value = 1
        redSlider.minimumTrackTintColor = .red
        
        
        greenSlider.value = 1
        greenSlider.minimumTrackTintColor = .green
        
        
        blueSlider.value = 1
        blueSlider.minimumTrackTintColor = .blue
        
       view.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        valueRed.text = String(format: "%.2f", redSlider.value)
        valueGreen.text = String(format: "%.2f", greenSlider.value)
        valueBlue.text = String(format: "%.2f", blueSlider.value)
    }

    @IBAction func sliderMovement() {
        view.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        valueRed.text = String(format: "%.2f", redSlider.value)
        valueGreen.text = String(format: "%.2f", greenSlider.value)
        valueBlue.text = String(format: "%.2f", blueSlider.value)
    }
}

