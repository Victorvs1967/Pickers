//
//  SingleComponentPickerViewController.swift
//  Pickers
//
//  Created by Victor Smirnov on 01/12/2017.
//  Copyright © 2017 Victor Smirnov. All rights reserved.
//

import UIKit

class SingleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
  @IBOutlet weak var singlePicker: UIPickerView!
  
  private let characterNames = [
      "Luke", "Leia", "Han", "Chewbacca", "Artoo",
      "Threepio", "Lando"
      ]
  
  @IBAction func onButtonPress(_ sender: UIButton) {
    let row = singlePicker.selectedRow(inComponent: 0)
    let selected = characterNames[row]
    let title = "You selected \(selected)!"
    let alert = UIAlertController(title: title, message: "Thank you for chooising", preferredStyle: .alert)
    let action = UIAlertAction(title: "You'r welcome", style: .default, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return characterNames.count
  }
  
  // MARK: - Picker Delegate
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return characterNames[row]
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
