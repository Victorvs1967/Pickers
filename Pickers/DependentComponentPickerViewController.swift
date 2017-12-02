//
//  DependentComponentPickerViewController.swift
//  Pickers
//
//  Created by Victor Smirnov on 01/12/2017.
//  Copyright © 2017 Victor Smirnov. All rights reserved.
//

import UIKit

class DependentComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
  private let stateComponent = 0
  private let zipComponent = 1
  private var stateZips: [String: [String]]!
  private var states: [String]!
  private var zips: [String]!
  
  @IBOutlet weak var dependentPicker: UIPickerView!
  
  @IBAction func onButtonPressed(_ sender: Any) {
    let stateRow = dependentPicker.selectedRow(inComponent: stateComponent)
    let zipRow = dependentPicker.selectedRow(inComponent: zipComponent)
    
    let state = states[stateRow]
    let zip = zips[zipRow]
    
    let title = "You select zip code \(zip)"
    let message = "\(zip) in state \(state)"
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  // MARK: Picker Data Source
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if component == stateComponent {
      return states.count
    } else {
      return zips.count
    }
  }
  
  // MARK: Picker Delegate
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if component == stateComponent {
      let selectedState = states[row]
      zips = stateZips[selectedState]
      dependentPicker.reloadComponent(zipComponent)
      dependentPicker.selectRow(0, inComponent: zipComponent, animated: true)
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if component == stateComponent {
      return states[row]
    } else {
      return zips[row]
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
    let pickerWidth = pickerView.bounds.size.width
    if component == zipComponent {
      return pickerWidth / 3
    } else {
      return 2 * pickerWidth / 3
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      let bundle = Bundle.main
      let plistURL = bundle.url(forResource: "statedictionary", withExtension: "plist")
      stateZips = NSDictionary.init(contentsOf: plistURL!) as! [String: [String]]
      let allStates = stateZips.keys
      states = allStates.sorted()
      let selectedState = states[0]
      zips = stateZips[selectedState]
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
