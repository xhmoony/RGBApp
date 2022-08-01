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
    
    @IBOutlet var randomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueForm.alpha = 0.5
        valueForm.layer.cornerRadius = 15
        
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
    // MARK: -
    //и еще решил поэкспериментировать
    @IBAction func randomAction() {
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        
    view.backgroundColor = UIColor(
            red: randomRed,
            green: randomGreen,
            blue: randomBlue,
            alpha: 1
            )
        
    //не смог понять как сделать так что бы при нажатие на кнопку слайдеры вставали соответсвенно
    //выпавшему цвету
        
    //и не смог понять как сделать прозрачным фон кнопки, такой же как у valueForm,
    //через withAlphaComponent не получается
    //по этому сделал через атрибуты
    }
    
}

