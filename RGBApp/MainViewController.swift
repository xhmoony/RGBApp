//
//  MainViewController.swift
//  RGBPalette
//
//  Created by Владимир Х. on 30.08.2022.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class MainViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingViewController = segue.destination as? SettingViewController else { return }
        settingViewController.delegate = self
        settingViewController.view.backgroundColor = view.backgroundColor
    }
}

extension MainViewController: SettingViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

