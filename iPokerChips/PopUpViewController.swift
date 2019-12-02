//
//  PopUpViewController.swift
//  iPokerChips
//
//  Created by Billy Habimana Cyusa on 12/2/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var choices = ["1", "2", "3"]
    var picker: UIPickerView = UIPickerView()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choices.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choices[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
    }
    
    
    
    
    func createPickerView() {
        
        picker = UIPickerView(frame: CGRect(x:30, y: 225, width: 200, height: 300))
        picker.numberOfRows(inComponent: choices.count)
        self.view.addSubview(picker)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        createPickerView()
        self.picker.dataSource = self
        self.picker.delegate = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
