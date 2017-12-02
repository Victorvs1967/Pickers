//
//  DoubleComponentPickerViewController.swift
//  Pickers
//
//  Created by Victor Smirnov on 01/12/2017.
//  Copyright © 2017 Victor Smirnov. All rights reserved.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if component == breadComponent {
      return breadType.count
    } else {
      return fillingType.count
    }
  }
  
  // MARK: Picker Delegate
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if component == breadComponent {
      return breadType[row]
    } else {
      return fillingType[row]
    }
  }
  
  @IBOutlet weak var doublePicker: UIPickerView!
  
  private let fillingComponent = 0
  private let breadComponent = 1
  private let fillingType = [
              "Ham", "Turkey", "Peanut Butter", "Tuna Salad",
              "Chiken Salad", "Roast Beef", "Vegemite"
              ]
  private let breadType = [
              "White", "Whole Wheat", "Rye", "Sourdough", "Seven Grain"]
  
  @IBAction func onButtonPressed(_ sender: Any) {
    let fillingRow = doublePicker.selectedRow(inComponent: fillingComponent)
    let breadRow = doublePicker.selectedRow(inComponent: breadComponent)
    let fiiling = fillingType[fillingRow]
    let bread = breadType[breadRow]
    let message = "Your \(fiiling) on \(bread) bread will be right up."
    let alert = UIAlertController(title: "Thank you for your order.", message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Great", style: .default, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
